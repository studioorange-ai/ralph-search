#!/bin/bash

# Validation Checker
# Usage: ./validation-checker.sh <validation_file.md>
#
# Parses a validation report and extracts key metrics.
# Useful for quick status checks during orchestration.

set -e

VALIDATION_FILE="${1:?Error: Please provide a validation file path}"

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}Validation Checker${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ ! -f "$VALIDATION_FILE" ]; then
    echo -e "${RED}Error: File not found: $VALIDATION_FILE${NC}"
    exit 1
fi

echo "File: $VALIDATION_FILE"
echo ""

# Extract phase info
phase_name=$(grep -m1 "^## Phase:" "$VALIDATION_FILE" 2>/dev/null | sed 's/^## Phase: //' || echo "Unknown")
echo "Phase: $phase_name"

# Extract date
date=$(grep -m1 "^\*\*Date\*\*:" "$VALIDATION_FILE" 2>/dev/null | sed 's/\*\*Date\*\*: //' || echo "Unknown")
echo "Date: $date"

# Extract time spent
time_spent=$(grep -m1 "^\*\*Time Spent\*\*:" "$VALIDATION_FILE" 2>/dev/null | sed 's/\*\*Time Spent\*\*: //' || echo "Unknown")
echo "Time: $time_spent"

# Extract cost
cost=$(grep -m1 "^\*\*Cost Spent\*\*:" "$VALIDATION_FILE" 2>/dev/null | sed 's/\*\*Cost Spent\*\*: //' || echo "Unknown")
echo "Cost: $cost"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Extract overall score
score=$(grep -m1 "^## Overall Phase Score:" "$VALIDATION_FILE" 2>/dev/null | grep -o '[0-9.]*' | head -1 || echo "?")
echo "Overall Score: $score/10"

echo ""

# Extract validation result
if grep -qi "VALIDATION RESULT.*PASS" "$VALIDATION_FILE"; then
    echo -e "Result: ${GREEN}PASS${NC}"
    exit_code=0
elif grep -qi "VALIDATION RESULT.*FAIL" "$VALIDATION_FILE"; then
    echo -e "Result: ${RED}FAIL${NC}"
    exit_code=1
elif grep -qi "VALIDATION RESULT.*NEEDS REVIEW" "$VALIDATION_FILE"; then
    echo -e "Result: ${YELLOW}NEEDS REVIEW${NC}"
    exit_code=2
else
    echo -e "Result: ${YELLOW}UNKNOWN${NC}"
    exit_code=1
fi

echo ""

# Extract criteria results
echo "Criteria Summary:"
echo "─────────────────"

# Count PASS and FAIL criteria
pass_count=$(grep -c "Status.*PASS" "$VALIDATION_FILE" 2>/dev/null || echo "0")
fail_count=$(grep -c "Status.*FAIL" "$VALIDATION_FILE" 2>/dev/null || echo "0")

echo -e "  ${GREEN}PASS: $pass_count${NC}"
echo -e "  ${RED}FAIL: $fail_count${NC}"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Extract key risks if any
risks=$(grep -A2 "^### Risk" "$VALIDATION_FILE" 2>/dev/null | head -10)
if [ -n "$risks" ]; then
    echo ""
    echo "Key Risks:"
    echo "$risks" | head -6
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${CYAN}Check complete${NC}"

exit $exit_code
