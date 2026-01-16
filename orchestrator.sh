#!/bin/bash

# Ralph Search Orchestrator
# Similar to Ralph but for research validation instead of code
# Usage: ./orchestrator.sh projects/your-app-name

set -e  # Exit on error

# ===== CONFIGURATION =====

PROJECT_DIR="${1:?Error: Please provide project directory (e.g., projects/my-app)}"
RESEARCH_PRD="$PROJECT_DIR/research-prd.md"
CHECKPOINT_DIR="$PROJECT_DIR/checkpoints"
CONFIG_FILE="config/research-config.json"
MAX_PHASES=6

# Colors for pretty output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ===== LOGGING FUNCTIONS =====

log_header() {
    echo ""
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_phase() {
    echo ""
    echo -e "${CYAN}📊 PHASE $1: $2${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ===== PREREQUISITE CHECKS =====

check_prerequisites() {
    log_info "Checking prerequisites..."

    # Check if project directory exists
    if [ ! -d "$PROJECT_DIR" ]; then
        log_error "Project directory not found: $PROJECT_DIR"
        exit 1
    fi

    # Check if research PRD exists
    if [ ! -f "$RESEARCH_PRD" ]; then
        log_error "Research PRD not found: $RESEARCH_PRD"
        log_info "Please generate it from intake.md first"
        exit 1
    fi

    # Check if Claude Code is available
    if ! command -v claude &> /dev/null; then
        log_error "Claude Code CLI not found in PATH"
        log_info "Please install Claude Code: https://docs.anthropic.com"
        exit 1
    fi

    # Create checkpoint directory if it doesn't exist
    mkdir -p "$CHECKPOINT_DIR"

    log_success "Prerequisites check passed"
}

# ===== PHASE EXECUTION =====

execute_phase() {
    local phase=$1
    local phase_name=$2

    log_phase "$phase" "$phase_name"

    # Create research subdirectory for this phase
    mkdir -p "$PROJECT_DIR/research/phase$phase"

    # Execute phase using Claude Code
    log_info "Executing research tasks..."

    # Get the script directory to find agents and templates
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    claude "$PROJECT_DIR" <<EOF
Read research-prd.md and focus on PHASE $phase: $phase_name.

Execute all tasks listed for this phase:
1. Complete each checklist item
2. Use the specified data collection methods
3. Save all outputs to the specified file locations
4. Generate comprehensive reports (not summaries)

After completing all tasks:
1. Read the appropriate validator agent from $SCRIPT_DIR/agents/
2. Validate your findings against the criteria
3. Generate validation report in checkpoints/phase${phase}-validation.md
4. Use the validation-report-template.md from $SCRIPT_DIR/templates/ as the structure

Mark validation as PASS, FAIL, or NEEDS REVIEW based on criteria.

If FAIL: document why and suggest remediation strategies.
If NEEDS REVIEW: explain what requires human judgment.

Start working now.
EOF

    log_success "Phase $phase research completed"
}

# ===== VALIDATION CHECKING =====

check_validation() {
    local phase=$1
    local validation_file="$CHECKPOINT_DIR/phase${phase}-validation.md"

    log_info "Checking validation results..."

    # Check if validation file exists
    if [ ! -f "$validation_file" ]; then
        log_error "Validation file not found: $validation_file"
        return 1
    fi

    # Parse validation result (case-insensitive search)
    if grep -qi "VALIDATION RESULT.*PASS" "$validation_file"; then
        log_success "Phase $phase validation: PASS"
        return 0
    elif grep -qi "VALIDATION RESULT.*FAIL" "$validation_file"; then
        log_error "Phase $phase validation: FAIL"
        return 1
    elif grep -qi "VALIDATION RESULT.*NEEDS REVIEW" "$validation_file"; then
        log_warning "Phase $phase validation: NEEDS REVIEW"
        return 2
    else
        log_error "Could not determine validation status"
        return 1
    fi
}

# ===== REMEDIATION =====

attempt_remediation() {
    local phase=$1
    local attempt=$2
    local validation_file="$CHECKPOINT_DIR/phase${phase}-validation.md"

    log_warning "Attempting remediation for Phase $phase (attempt $attempt/2)"

    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # Re-execute phase with remediation guidance
    claude "$PROJECT_DIR" <<EOF
Read research-prd.md and checkpoints/phase${phase}-validation.md.

The previous attempt at Phase $phase FAILED validation.

Review the failure reasons and remediation strategies in the validation report.

Now re-attempt Phase $phase with these improvements:
1. Try the suggested remediation strategies
2. Use different search terms or data sources
3. Broaden or narrow scope as suggested
4. Document what you tried differently this time

After completing remediation:
1. Re-validate against the criteria using the validator agent from $SCRIPT_DIR/agents/
2. Update the validation report
3. Increment remediation attempt counter

Mark as PASS, FAIL, or NEEDS REVIEW.

Start remediation now.
EOF

    log_info "Remediation attempt completed"
}

# ===== HUMAN REVIEW =====

request_human_review() {
    local phase=$1
    local validation_file="$CHECKPOINT_DIR/phase${phase}-validation.md"

    log_warning "Phase $phase requires human review"
    echo ""
    echo -e "${YELLOW}Please review the validation report:${NC}"
    echo -e "${YELLOW}  $validation_file${NC}"
    echo ""
    echo -e "${YELLOW}Questions for you:${NC}"
    grep -A 5 "Questions for Human:" "$validation_file" 2>/dev/null | sed 's/^/  /' || echo "  (No specific questions found in report)"
    echo ""
    echo -e "${YELLOW}Options:${NC}"
    echo "  1) Accept as PASS (continue to next phase)"
    echo "  2) Mark as FAIL (attempt remediation)"
    echo "  3) Stop research (exit)"
    echo ""
    read -p "Your decision [1/2/3]: " decision

    case $decision in
        1)
            log_success "Human approved: treating as PASS"
            # Update validation file to PASS (macOS compatible)
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: PASS (human approved)/' "$validation_file"
            else
                sed -i 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: PASS (human approved)/' "$validation_file"
            fi
            return 0
            ;;
        2)
            log_warning "Human marked as FAIL: attempting remediation"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: FAIL (human decision)/' "$validation_file"
            else
                sed -i 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: FAIL (human decision)/' "$validation_file"
            fi
            return 1
            ;;
        3)
            log_error "Human stopped research"
            exit 1
            ;;
        *)
            log_error "Invalid choice. Treating as FAIL."
            return 1
            ;;
    esac
}

# ===== BUDGET TRACKING =====

check_budget() {
    local phase=$1

    # Parse spent time/money from validation reports
    local total_hours=0
    local total_cost=0

    for i in $(seq 1 $phase); do
        validation_file="$CHECKPOINT_DIR/phase${i}-validation.md"
        if [ -f "$validation_file" ]; then
            # Extract time spent (simplified - you could make this more robust)
            hours=$(grep -o "Time Spent:.*[0-9.]*" "$validation_file" 2>/dev/null | grep -o '[0-9.]*' | head -1 || echo "0")
            cost=$(grep -o "Cost Spent:.*\$[0-9.]*" "$validation_file" 2>/dev/null | grep -o '[0-9.]*' | head -1 || echo "0")

            if [ -n "$hours" ]; then
                total_hours=$(echo "$total_hours + $hours" | bc 2>/dev/null || echo "$total_hours")
            fi
            if [ -n "$cost" ]; then
                total_cost=$(echo "$total_cost + $cost" | bc 2>/dev/null || echo "$total_cost")
            fi
        fi
    done

    log_info "Budget used: ${total_hours}h / \$${total_cost}"

    # Check against config limits (simplified)
    # You could make this more sophisticated by reading from config JSON
}

# ===== FINAL SYNTHESIS =====

run_synthesis() {
    log_header "FINAL SYNTHESIS"
    log_info "All phases passed! Generating final recommendation..."

    # Create deliverables directory
    mkdir -p "$PROJECT_DIR/deliverables"

    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # Run synthesis
    claude "$PROJECT_DIR" <<EOF
Read research-prd.md and all validation reports in checkpoints/.

Now execute PHASE 6: Final Synthesis & Recommendation.

Tasks:
1. Compile all findings from Phases 1-5
2. Score each phase based on validation strength
3. Calculate weighted overall score
4. Identify critical risks and mitigations
5. Generate clear GO/NO-GO recommendation

Generate these deliverables:
- deliverables/EXECUTIVE-SUMMARY.md (2-page overview)
- deliverables/GO-NO-GO-DECISION.md (recommendation with reasoning)
- deliverables/NEXT-STEPS.md (what to do next)
- deliverables/RISK-REGISTER.md (risks and mitigations)
- deliverables/FULL-RESEARCH-REPORT.md (comprehensive 40-60 page report)

Use the decision framework from the research PRD.

Make your recommendation clear and actionable.

Start synthesis now.
EOF

    log_success "Synthesis completed!"
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}  Market Research Complete!${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${CYAN}Final Deliverables:${NC}"
    echo -e "  📄 Executive Summary: ${PROJECT_DIR}/deliverables/EXECUTIVE-SUMMARY.md"
    echo -e "  🎯 GO/NO-GO Decision: ${PROJECT_DIR}/deliverables/GO-NO-GO-DECISION.md"
    echo -e "  📋 Next Steps: ${PROJECT_DIR}/deliverables/NEXT-STEPS.md"
    echo -e "  ⚠️  Risk Register: ${PROJECT_DIR}/deliverables/RISK-REGISTER.md"
    echo -e "  📚 Full Report: ${PROJECT_DIR}/deliverables/FULL-RESEARCH-REPORT.md"
    echo ""
}

# ===== MAIN EXECUTION LOOP =====

main() {
    log_header "Ralph Search v1.0"
    log_info "Project: $PROJECT_DIR"

    check_prerequisites

    CURRENT_PHASE=1

    # Phase names for pretty output
    PHASE_NAMES=(
        "placeholder"  # index 0 (unused)
        "Market Landscape Scan"
        "Avatar Pain Mining"
        "Competitive Differentiation"
        "Pricing & Economics"
        "Go-To-Market Strategy"
        "Final Synthesis"
    )

    while [ $CURRENT_PHASE -le $MAX_PHASES ]; do
        phase_name="${PHASE_NAMES[$CURRENT_PHASE]}"

        # Execute phase
        execute_phase $CURRENT_PHASE "$phase_name"

        # Check validation
        check_validation $CURRENT_PHASE
        validation_result=$?

        if [ $validation_result -eq 0 ]; then
            # PASS - move to next phase
            log_success "Proceeding to next phase"
            check_budget $CURRENT_PHASE
            CURRENT_PHASE=$((CURRENT_PHASE + 1))

        elif [ $validation_result -eq 2 ]; then
            # NEEDS REVIEW - request human input
            request_human_review $CURRENT_PHASE
            review_result=$?

            if [ $review_result -eq 0 ]; then
                # Human approved - move forward
                CURRENT_PHASE=$((CURRENT_PHASE + 1))
            else
                # Human wants remediation - try fixing
                attempt_remediation $CURRENT_PHASE 1
                check_validation $CURRENT_PHASE

                if [ $? -eq 0 ]; then
                    CURRENT_PHASE=$((CURRENT_PHASE + 1))
                else
                    log_error "Remediation failed"
                    exit 1
                fi
            fi

        else
            # FAIL - attempt remediation
            attempt_remediation $CURRENT_PHASE 1
            check_validation $CURRENT_PHASE

            if [ $? -eq 0 ]; then
                # Remediation successful
                log_success "Remediation successful"
                CURRENT_PHASE=$((CURRENT_PHASE + 1))
            else
                # Try one more time
                log_warning "First remediation failed, trying again..."
                attempt_remediation $CURRENT_PHASE 2
                check_validation $CURRENT_PHASE

                if [ $? -eq 0 ]; then
                    log_success "Second remediation successful"
                    CURRENT_PHASE=$((CURRENT_PHASE + 1))
                else
                    log_error "STOP: Phase $CURRENT_PHASE failed after 2 remediation attempts"
                    log_error "See $CHECKPOINT_DIR/phase${CURRENT_PHASE}-validation.md for details"
                    echo ""
                    echo -e "${RED}Research stopped. This project may not be viable.${NC}"
                    exit 1
                fi
            fi
        fi

        # Optional: pause for human review if configured
        # (You could add a config flag for this)

    done

    # All phases passed - run final synthesis
    run_synthesis
}

# ===== SCRIPT ENTRY POINT =====

main "$@"
