# Phase {{PHASE_NUMBER}} Validation Report

## Phase: {{PHASE_NAME}}
**Date**: {{DATE}}
**Time Spent**: {{HOURS}} hours
**Cost Spent**: ${{AMOUNT}}
**Researcher**: Claude Code + {{AGENT_NAME}}

---

## Executive Summary
[2-3 sentence summary of what was discovered and whether phase passed]

---

## Tasks Completed

### Task Completion Status
- [X/X] Task {{N}}.1: {{DESCRIPTION}}
- [X/X] Task {{N}}.2: {{DESCRIPTION}}
- [X/X] Task {{N}}.3: {{DESCRIPTION}}
- [X/X] Task {{N}}.4: {{DESCRIPTION}}
- [X/X] Task {{N}}.5: {{DESCRIPTION}}

### Tasks Not Completed (if any)
- Task {{N}}.X: {{DESCRIPTION}}
  - **Reason**: [Why this wasn't completed]
  - **Impact**: [Does this affect validation?]

---

## Validation Criteria Results

### Criterion 1: {{CRITERION_DESCRIPTION}}
- **Status**: [PASS / FAIL]
- **Finding**: [What we discovered - be specific with numbers/data]
- **Evidence**: [Where did this come from? Sources/links]
- **Pass/Fail Reasoning**: [Why it passed or failed]

### Criterion 2: {{CRITERION_DESCRIPTION}}
- **Status**: [PASS / FAIL]
- **Finding**: [What we discovered]
- **Evidence**: [Sources]
- **Pass/Fail Reasoning**: [Why]

### Criterion 3: {{CRITERION_DESCRIPTION}}
- **Status**: [PASS / FAIL]
- **Finding**: [What we discovered]
- **Evidence**: [Sources]
- **Pass/Fail Reasoning**: [Why]

### Criterion 4: {{CRITERION_DESCRIPTION}} (if applicable)
- **Status**: [PASS / FAIL]
- **Finding**: [What we discovered]
- **Evidence**: [Sources]
- **Pass/Fail Reasoning**: [Why]

---

## Key Findings

### Finding 1: [Most Important Discovery]
- **Description**: [What we learned]
- **Implication**: [What this means for the project]
- **Source**: [Where this came from]

### Finding 2: [Second Most Important]
- **Description**: [What we learned]
- **Implication**: [What this means]
- **Source**: [Where this came from]

### Finding 3: [Third Most Important]
- **Description**: [What we learned]
- **Implication**: [What this means]
- **Source**: [Where this came from]

### Surprising Discoveries
- [Anything unexpected that came up during research]
- [Things that contradicted initial hypotheses]

---

## Data Quality Assessment

### Completeness: {{SCORE}}/10
- **Rationale**: [Why this score - did we get all the data we needed?]
- **Gaps**: [What data is missing, if any?]

### Reliability: {{SCORE}}/10
- **Rationale**: [Can we trust this data?]
- **Concerns**: [Any questionable sources or data points?]

### Relevance: {{SCORE}}/10
- **Rationale**: [How relevant is this data to our decision?]
- **Off-topic**: [Anything we found that wasn't useful?]

---

## Overall Phase Score: {{SCORE}}/10

**Scoring Breakdown**:
- Task completion: {{SCORE}}/10
- Validation criteria met: {{SCORE}}/10
- Data quality: {{SCORE}}/10
- Insights generated: {{SCORE}}/10

---

## VALIDATION RESULT: {{PASS / FAIL / NEEDS REVIEW}}

### If PASS:

**Reason**: [Clear explanation of why this phase passed validation]

**Confidence Level**: {{HIGH / MEDIUM / LOW}}

**Next Phase**: Proceed to Phase {{NEXT_PHASE}}

**Carry Forward**:
- [Key finding #1 to use in next phase]
- [Key finding #2 to use in next phase]
- [Data/assumptions to carry forward]

**Dependencies Created**:
- [What does next phase depend on from this phase?]

---

### If FAIL:

**Reason**: [Clear explanation of why this phase failed validation]

**Missing**:
- [What data/criteria we couldn't satisfy]
- [What we tried to find but couldn't]

**Remediation Attempts**: {{COUNT}}/2

**Remediation Strategy**:
- [Approach #1 to try: Different search terms? Different sources?]
- [Approach #2 to try: Broaden scope? Narrow focus?]
- [Approach #3 to try: Manual research needed?]

**Stop Recommendation**: {{YES / NO}}
- **Reasoning**: [Should we stop the entire project? Why/why not?]
- **If Stop**: [What should we do instead? Pivot? Different market?]
- **If Continue**: [What gives us confidence we can remediate?]

---

### If NEEDS REVIEW:

**Reason**: [Why human judgment is needed]

**Ambiguity**:
- [What's unclear - e.g., "Found 45 quotes, need 50. Close enough?"]
- [Borderline metrics that could go either way]

**Questions for Human**:
1. [Specific question requiring judgment - e.g., "TAM is $8M, we wanted $10M. Proceed?"]
2. [Second question - e.g., "Found competitor about to launch similar feature. Big risk?"]
3. [Third question - e.g., "Avatar pain seems moderate not severe. Acceptable?"]

**Recommendation**: [What would you do if you were the human reviewer?]

---

## Risks Identified

### Risk 1: {{RISK_DESCRIPTION}}
- **Likelihood**: [High / Medium / Low]
- **Impact**: [High / Medium / Low]
- **Mitigation Strategy**: [How to address this risk]
- **Owner**: [Who should manage this - e.g., "Next phase research" or "Human decision"]

### Risk 2: {{RISK_DESCRIPTION}}
- **Likelihood**: [High / Medium / Low]
- **Impact**: [High / Medium / Low]
- **Mitigation Strategy**: [How to address]
- **Owner**: [Who manages]

### Risk 3: {{RISK_DESCRIPTION}}
- **Likelihood**: [High / Medium / Low]
- **Impact**: [High / Medium / Low]
- **Mitigation Strategy**: [How to address]
- **Owner**: [Who manages]

---

## Recommendations

### For Next Phase (if PASS)
1. [Action item - e.g., "Use pricing data from Phase 1 competitors"]
2. [Action item - e.g., "Focus research on top 3 pain themes identified"]
3. [Action item - e.g., "Validate differentiation against top 5 competitors only"]

### For Remediation (if FAIL)
1. [Action item - e.g., "Try searching in different communities: X, Y, Z"]
2. [Action item - e.g., "Use paid tool (Apify $10) to get more data"]
3. [Action item - e.g., "Broaden avatar definition to include related personas"]

### For Human Review (if NEEDS REVIEW)
1. [What the human should look at first]
2. [What decision needs to be made]
3. [What would change outcome to PASS vs FAIL]

---

## Appendix: Research Artifacts

### Files Generated This Phase
- `{{FILE_PATH_1}}` - [Description of what's in this file]
- `{{FILE_PATH_2}}` - [Description]
- `{{FILE_PATH_3}}` - [Description]

### External Links/Sources Used
- [Source 1 name]: {{URL}}
- [Source 2 name]: {{URL}}
- [Source 3 name]: {{URL}}

### Tools Used
- [Tool name]: [What it was used for]
- [Tool name]: [What it was used for]

---

## Meta: About This Validation

**Validation Agent Used**: {{AGENT_NAME}} (see `/agents/{{AGENT_NAME}}.md`)

**Validation Executed By**: Claude Code

**Validation Timestamp**: {{TIMESTAMP}}

**Validation Duration**: {{MINUTES}} minutes

---

*This validation report was generated automatically by Ralph Search.*
*For questions about methodology, see `/docs/PHASE-GUIDE.md`*
