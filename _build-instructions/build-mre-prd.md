# PRD: Build Market Research Engine (MRE) System

## Project Overview
Build a Ralph-style autonomous research system that executes market validation for product ideas. The system loops through research phases, validates findings at checkpoints, and produces comprehensive GO/NO-GO decisions.

## Success Criteria
- [ ] Complete folder structure with all templates
- [ ] Working orchestrator.sh that loops through phases
- [ ] All 6 research phases defined with validation criteria
- [ ] Example project (QuickRephrase) fully configured
- [ ] Documentation for how to use the system
- [ ] Can be executed with: `./orchestrator.sh projects/quickrephrase`

## Technology Stack
- Bash scripts for orchestration
- Markdown for all research artifacts
- JSON for configuration
- Claude Code as the research executor
- Node.js for any helper tools (optional)

---

## PHASE 1: Create Folder Structure

### Tasks
- [ ] 1.1: Create main project directory structure
- [ ] 1.2: Create templates folder with all template files
- [ ] 1.3: Create agents folder (for validator agents)
- [ ] 1.4: Create tools folder (for helper scripts)
- [ ] 1.5: Create example project folder (quickrephrase)
- [ ] 1.6: Create config folder with examples

### File Structure to Create
```
ralph-search/
├── README.md
├── orchestrator.sh
├── config/
│   ├── research-config.json
│   └── research-config.example.json
├── templates/
│   ├── project-intake-form.md
│   ├── research-prd-template.md
│   └── validation-report-template.md
├── agents/
│   ├── market-validator.md
│   ├── avatar-validator.md
│   ├── pricing-validator.md
│   └── gtm-validator.md
├── tools/
│   ├── reddit-search.sh
│   ├── competitor-finder.sh
│   └── validation-checker.sh
├── projects/
│   └── quickrephrase/
│       ├── intake.md
│       ├── research-prd.md
│       ├── checkpoints/
│       ├── research/
│       │   ├── phase1/
│       │   ├── phase2/
│       │   ├── phase3/
│       │   ├── phase4/
│       │   └── phase5/
│       └── deliverables/
└── docs/
    ├── USAGE.md
    ├── PHASE-GUIDE.md
    └── EXAMPLES.md
```

### Validation
- [ ] All directories exist
- [ ] No typos in folder names
- [ ] Structure matches specification exactly

---

## PHASE 2: Create Core Templates

### Task 2.1: Create project-intake-form.md

**Purpose**: What users fill out to start research (5 min form)

**File location**: `templates/project-intake-form.md`

**Full contents to include**:
```markdown
# Market Research Intake: {{APP_NAME}}

## Basic Info
**App Name**: [Your app name]
**One-Line Description**: [What it does in one sentence]
**Your Role**: [Founder/Developer/etc]
**Date**: {{TODAY}}

## The Problem (in your words)
[Describe the problem you're solving. Be specific about frustrations.]

Example: "I constantly need to rephrase text (emails, messages, content) but I hate opening ChatGPT in a new tab, copy-pasting back and forth, losing my flow, and wasting 2-3 minutes every time."

## Target Avatar (your hypothesis)
**Who**: [Specific type of person - be narrow, not "everyone"]
**Where they are**: [Specific communities - r/productivity, #MacProductivity, Indie Hackers]
**What they currently use**: [Current solutions - ChatGPT, TextExpander, Grammarly]
**Why they'd care**: [Why your solution matters - saves time, keeps them in flow]

## Your Unique Approach
**What makes you different**: [Your unique mechanism]
**Why this matters**: [Why the difference is valuable, not just a feature]

Example: "AI-powered text transformation at point of writing (context menu or keyboard shortcut), no app switching required. This matters because existing tools require leaving your workflow."

## Initial Assumptions (we'll validate these)
- **Market size**: [Your TAM estimate - e.g., $50-100M for Mac productivity tools]
- **Willingness to pay**: [Your pricing hypothesis - e.g., $29-$47 one-time purchase]
- **Competitive advantage**: [What makes you 10x better - e.g., 10x faster than ChatGPT tab]
- **Time to build MVP**: [Your timeline estimate - e.g., 2 weeks]
- **Path to first 100 customers**: [Your GTM hypothesis - e.g., Reddit, Product Hunt, Twitter]

## Research Priorities (what you most want to know)
1. [Question 1 - e.g., Is the "flow breaking" pain real for others or just me?]
2. [Question 2 - e.g., How much would they actually pay for this?]
3. [Question 3 - e.g., Will TextExpander or competitors add this AI feature soon?]
4. [Question 4 - e.g., Can I reach enough people organically?]

## Constraints
**Time budget**: [X hours max for research - e.g., 15 hours]
**Money budget**: [$X max for tools/APIs - e.g., $50]
**Launch timeline**: [When you want to decide GO/NO-GO - e.g., within 1 week]
**Risk tolerance**: [Low/Medium/High - e.g., Medium - willing to spend 2 weeks building if research is positive]

## What success looks like
After research, I want to know:
- [ ] Clear answer: should I build this? (GO/NO-GO)
- [ ] If GO: what's the positioning, pricing, and launch strategy?
- [ ] If NO-GO: why not and what should I do instead?

---

## Notes for Research System
[Any additional context, constraints, or special considerations]
```

### Task 2.2: Create research-prd-template.md

**Purpose**: The master PRD template that gets customized per project

**File location**: `templates/research-prd-template.md`

**Full contents to include**:
```markdown
# Market Research PRD: {{APP_NAME}}

*Auto-generated from intake form on {{DATE}}*

## Research Mission
**Problem**: {{PROBLEM_STATEMENT}}
**Target Avatar**: {{INITIAL_AVATAR}}
**Expected Market**: {{MARKET_SIZE_GUESS}}
**Research Budget**: {{MAX_HOURS}} hours, {{MAX_COST}} dollars

## Phase Execution Rules
- Execute phases sequentially (1→2→3→4→5→6)
- Each phase must PASS validation before next phase starts
- If validation FAILS: document why, attempt remediation, flag for human review
- If remediation fails 2x: STOP and request human intervention
- Budget tracking: Stop if time/cost budget exceeded

---

## PHASE 1: Market Landscape Scan
**Objective**: Prove market exists and is accessible
**Time Budget**: 2 hours
**Cost Budget**: $0 (organic only)
**Validator Agent**: market-validator.md

### Research Tasks
- [ ] 1.1: Find 10 direct competitors (companies solving exact problem)
- [ ] 1.2: Find 10 indirect competitors (alternative solutions)
- [ ] 1.3: Scrape pricing from all competitor websites
- [ ] 1.4: Estimate competitor scale (funding, employees, traffic)
- [ ] 1.5: Calculate TAM using bottoms-up approach
- [ ] 1.6: Identify market growth rate (3-year trend)

### Data Collection Methods
- **Competitors**: Google search "[problem] software/app/tool", Product Hunt, G2, Capterra
- **Pricing**: Scrape /pricing pages, create pricing-data.json
- **Scale**: Use BuiltWith, LinkedIn company pages, Crunchbase (free tier)
- **TAM**: (# potential customers) × (avg price) × (% addressable)
- **Growth**: Google Trends for category, VC funding trends via Crunchbase

### Validation Criteria (Must pass ALL)
- [ ] Found 5+ competitors with public pricing (proves market exists)
- [ ] TAM > $10M/year (big enough to pursue)
- [ ] Market growing or stable (not shrinking >10%/year)
- [ ] Can identify where target avatar congregates online

### Output Files
- `research/phase1/competitor-matrix.md` (20 competitors with data)
- `research/phase1/pricing-analysis.md` (range, models, tiers)
- `research/phase1/tam-calculation.md` (with sources and assumptions)
- `research/phase1/market-trends.md` (growth indicators)
- `checkpoints/phase1-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No competitors found**: Try different search terms? Different market category name?
- **TAM too small**: Broaden avatar definition? Different pricing model (higher price)?
- **Market shrinking**: Is problem being solved differently? Should we pivot?

### STOP Criteria
- Can't find ANY competitors (no market validation)
- TAM < $5M (too small even after adjustments)
- Market declining >20%/year (dying category)

---

## PHASE 2: Avatar Pain Mining
**Objective**: Find verbatim evidence of pain in target avatar's own words
**Time Budget**: 4 hours
**Cost Budget**: $20 (Reddit API, scraping tools)
**Validator Agent**: avatar-validator.md

### Research Tasks
- [ ] 2.1: Identify 5-10 communities where avatar hangs out
- [ ] 2.2: Scrape top 500 posts/comments about the problem
- [ ] 2.3: Extract verbatim pain quotes (50+ quotes minimum)
- [ ] 2.4: Cluster pain themes (what hurts most?)
- [ ] 2.5: Identify current workarounds (proves willingness to solve)
- [ ] 2.6: Calculate pain frequency (daily/weekly/monthly)
- [ ] 2.7: Estimate economic cost of pain (time × hourly rate or money spent)

### Data Collection Methods
- **Communities**: Reddit subreddits, Twitter hashtags, Indie Hackers, niche forums
- **Reddit**: Use Apify Reddit Scraper ($5-10) or PRAW API (free but rate-limited)
- **Twitter**: Search API for "[problem] frustrated/annoying/hate" (free tier)
- **Forums**: Manual scraping (Discourse, Slack archives if public)
- **Clustering**: Use Claude to group similar complaints into themes
- **Economic cost**: If mentioned explicitly, or calculate: (freq per week) × (time wasted) × ($100/hr estimate)

### Validation Criteria (Must pass ALL)
- [ ] Found 50+ verbatim quotes articulating the problem
- [ ] 3+ distinct pain themes emerged (proves multifaceted problem)
- [ ] Avatar uses workarounds (proves willingness to solve)
- [ ] Pain occurs weekly or more frequently (proves urgency)
- [ ] Economic cost > $100/year (proves worth paying for)

### Output Files
- `research/phase2/communities.md` (where avatar exists, with member counts and links)
- `research/phase2/pain-quotes.md` (50+ verbatim quotes with sources)
- `research/phase2/pain-themes.md` (clustered by theme, ranked by frequency)
- `research/phase2/workarounds.md` (what they currently do, how painful)
- `research/phase2/avatar-profile-v1.md` (synthesized from actual data)
- `checkpoints/phase2-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **<50 quotes**: Wrong communities? Try broader search? Different keywords?
- **No workarounds**: People complain but don't solve (bad sign - revisit problem definition)
- **Low frequency**: Not urgent enough - can we reframe problem as more frequent?
- **Low cost**: Price ceiling will be too low - need different avatar or problem

### STOP Criteria
- <20 quotes found after remediation (avatar doesn't exist or problem not real)
- No workarounds found (they don't care enough to solve)
- Monthly or less frequency (not urgent)
- Cost <$50/year (won't support viable pricing)

---

## PHASE 3: Competitive Differentiation Analysis
**Objective**: Find the unique angle that makes avatar choose you
**Time Budget**: 3 hours
**Cost Budget**: $10 (competitor research tools)
**Validator Agent**: market-validator.md + avatar-validator.md

### Research Tasks
- [ ] 3.1: Build comprehensive feature matrix (you vs. top 5 competitors)
- [ ] 3.2: Scrape competitor reviews (App Store, G2, Capterra, Trustpilot)
- [ ] 3.3: Identify gaps: what are they NOT solving?
- [ ] 3.4: Analyze negative reviews: what do users hate?
- [ ] 3.5: Map your unique mechanism vs. their approach
- [ ] 3.6: Calculate "10x better" dimension (must have ONE)
- [ ] 3.7: Assess copyability (can they replicate in 6 months?)

### Data Collection Methods
- **Features**: Scrape product pages, documentation, feature lists
- **Reviews**: Apify scrapers for App Store, G2, Trustpilot (or manual for top 3)
- **Gaps**: Compare feature matrix to pain themes from Phase 2
- **Sentiment**: Run sentiment analysis on negative reviews (use Claude)
- **Unique mechanism**: Synthesize from your intake + gaps found

### Validation Criteria (Must pass 3 of 4)
- [ ] ONE dimension where you're 10x better (not just incrementally)
- [ ] Gap maps to HIGH-INTENSITY pain theme from Phase 2
- [ ] 20+ reviews complaining about gap you solve
- [ ] Unique mechanism defensible for 12+ months

### Output Files
- `research/phase3/feature-matrix.md` (comprehensive comparison table)
- `research/phase3/review-analysis.md` (themes from 200+ reviews)
- `research/phase3/gaps-identified.md` (what's missing in market)
- `research/phase3/positioning-statement.md` (your unique angle)
- `research/phase3/defensibility-analysis.md` (how easily can they copy?)
- `checkpoints/phase3-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No 10x dimension**: You're a feature, not a product - can we find different angle?
- **Gap is low-priority pain**: Won't motivate switching - focus on higher pain?
- **Easy to copy**: No moat - need different technical approach or go-to-market speed
- **Already solved elsewhere**: Did we miss a competitor? Is our research incomplete?

### STOP Criteria
- No 10x dimension after remediation (you're just incrementally better)
- Easily copied by incumbents with large user bases
- Gap is low-priority pain (avatar won't switch for this)

---

## PHASE 4: Pricing & Economics Model
**Objective**: Determine optimal pricing and validate unit economics
**Time Budget**: 2 hours
**Cost Budget**: $0 (analysis only)
**Validator Agent**: pricing-validator.md

### Research Tasks
- [ ] 4.1: Analyze competitor pricing (from Phase 1)
- [ ] 4.2: Calculate avatar's current cost of problem (from Phase 2)
- [ ] 4.3: Determine pricing ceiling (max they'd pay)
- [ ] 4.4: Determine pricing floor (min to be credible)
- [ ] 4.5: Choose business model (one-time, subscription, usage-based, freemium)
- [ ] 4.6: Model 3 scenarios: conservative, realistic, optimistic
- [ ] 4.7: Calculate LTV for each scenario
- [ ] 4.8: Estimate CAC per channel (preview from Phase 5 research)
- [ ] 4.9: Validate LTV:CAC > 3:1 for realistic scenario

### Data Collection Methods
- **Ceiling**: Avatar's cost of problem ÷ 3 (typical value capture rate)
- **Floor**: Lowest competitor price OR $20 (credibility threshold for software)
- **LTV**: 
  - One-time: price × 1 (no recurring)
  - Subscription: price × expected years (typically 2-3 for indie tools)
  - Usage: price × expected monthly usage × retention months
- **CAC**: Industry benchmarks (SaaS: $50-200, one-time: $20-50 for organic)

### Validation Criteria (Must pass ALL)
- [ ] Pricing is <30% of avatar's cost of problem (clear ROI)
- [ ] LTV:CAC ratio > 3:1 in realistic scenario (profitable)
- [ ] Business model matches avatar buying psychology (from Phase 2 data)
- [ ] Gross margin > 70% at scale (sustainable for software)

### Output Files
- `research/phase4/pricing-analysis.md` (competitive benchmarks)
- `research/phase4/scenarios.md` (3 pricing models with projections)
- `research/phase4/unit-economics.md` (LTV, CAC, margin calculations with assumptions)
- `research/phase4/recommended-pricing.md` (final recommendation with reasoning)
- `checkpoints/phase4-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **ROI unclear**: Price too close to cost of problem - can we lower price or find bigger pain?
- **LTV:CAC < 3:1**: Acquisition too expensive - need cheaper channels or higher price
- **Model mismatch**: Subscription for one-time problem (or vice versa) - reconsider model
- **Low margin**: Cost structure won't scale - need different technical approach

### STOP Criteria
- LTV:CAC < 2:1 (can't make unit economics work)
- Margin < 50% (won't be profitable at scale)
- No clear ROI for avatar (won't pay)

---

## PHASE 5: Go-To-Market Strategy
**Objective**: Identify viable acquisition channels and launch strategy
**Time Budget**: 3 hours
**Cost Budget**: $10 (community research)
**Validator Agent**: gtm-validator.md

### Research Tasks
- [ ] 5.1: List ALL communities where avatar exists (from Phase 2)
- [ ] 5.2: Analyze successful launches in those communities
- [ ] 5.3: Estimate organic reach per channel
- [ ] 5.4: Estimate CAC per channel (organic + paid)
- [ ] 5.5: Identify content strategy (topics, formats, frequency)
- [ ] 5.6: Map partnership/integration opportunities
- [ ] 5.7: Design launch sequence (pre-launch, launch, post-launch)
- [ ] 5.8: Calculate path to first 100 customers

### Data Collection Methods
- **Communities**: Reddit member count, Twitter hashtag volume, forum daily active users
- **Successful launches**: Search Product Hunt, Reddit for similar products, analyze engagement
- **Reach estimates**: 
  - Reddit: 1-5% of subreddit sees post (varies by activity)
  - Twitter: 10-30% of followers see tweet (organic)
  - Product Hunt: 10K-50K views for featured products
- **CAC estimates**: 
  - Organic (Reddit/PH/Twitter): $0-$5 (time only)
  - Content marketing: $10-$30 (conversion from blog traffic)
  - Paid ads (Google/Facebook): $20-$100 (industry benchmarks)
- **Partnerships**: Find tools avatar already uses (Zapier, integrations)

### Validation Criteria (Must pass 3 of 4)
- [ ] Identified 2+ channels with estimated CAC < $50
- [ ] Can reach 1,000+ avatars organically within 30 days
- [ ] Found 3+ recent successful launches to learn from
- [ ] Clear path to first 100 customers within 90 days

### Output Files
- `research/phase5/channel-analysis.md` (all channels ranked by feasibility)
- `research/phase5/launch-playbook.md` (week-by-week plan)
- `research/phase5/content-strategy.md` (what to create, where to post)
- `research/phase5/partnerships.md` (integration opportunities)
- `research/phase5/first-100-plan.md` (specific tactics to get initial traction)
- `checkpoints/phase5-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **CAC too high**: Need different channels or pure organic approach
- **Can't reach avatar**: Wrong communities identified OR avatar not actually online
- **No recent successes**: Community may be saturated or hostile to launches
- **Path to 100 unclear**: Timeline too aggressive or avatar too diffuse

### STOP Criteria
- No channel with CAC <$100 (can't acquire profitably)
- Can't reach 500+ avatars organically (distribution problem)
- Avatar doesn't actually exist in identifiable communities

---

## PHASE 6: Final Synthesis & Recommendation
**Objective**: Combine all research into actionable GO/NO-GO decision
**Time Budget**: 1 hour
**Cost Budget**: $0 (synthesis only)
**Validator Agent**: ALL agents review

### Synthesis Tasks
- [ ] 6.1: Compile all validation results (Phases 1-5)
- [ ] 6.2: Score each phase (1-10 scale based on validation strength)
- [ ] 6.3: Calculate weighted overall score
- [ ] 6.4: Identify critical risks and mitigation strategies
- [ ] 6.5: Generate GO/NO-GO recommendation
- [ ] 6.6: If GO: provide immediate next steps (MVP scope, timeline, metrics)
- [ ] 6.7: If NO-GO: explain why + suggest pivots

### Decision Framework

**Must-Haves (ALL must pass)**
- Market exists (Phase 1 PASS)
- Pain is real (Phase 2 PASS)
- You're differentiated (Phase 3 PASS)
- Economics work (Phase 4 PASS)
- You can reach avatar (Phase 5 PASS)

**Weighted Scoring**
| Phase | Weight | Score | Weighted |
|-------|--------|-------|----------|
| Market Size | 15% | X/10 | X |
| Avatar Pain | 30% | X/10 | X |
| Differentiation | 25% | X/10 | X |
| Economics | 20% | X/10 | X |
| GTM Feasibility | 10% | X/10 | X |
| **TOTAL** | 100% | | **X/10** |

**Decision Rubric**
- Score ≥ 8.0: **STRONG GO** (high confidence, build immediately)
- Score 6.5-7.9: **CONDITIONAL GO** (address weaknesses first)
- Score 5.0-6.4: **WEAK GO** (risky, consider alternatives)
- Score < 5.0: **NO-GO** (pivot or abandon)

### Output Files
- `deliverables/EXECUTIVE-SUMMARY.md` (2-page overview)
- `deliverables/FULL-RESEARCH-REPORT.md` (all findings compiled, 40-60 pages)
- `deliverables/GO-NO-GO-DECISION.md` (final recommendation with clear reasoning)
- `deliverables/NEXT-STEPS.md` (if GO: MVP roadmap, if NO-GO: pivot ideas)
- `deliverables/RISK-REGISTER.md` (what could go wrong + mitigation)

---

## Human Intervention Points

The system will PAUSE and request human input at these points:

### Automatic Pause Triggers
1. **Any phase fails validation 2x** → "I tried to remediate but couldn't. What should I do?"
2. **Conflicting data** → "Source A says X, Source B says Y. How should I resolve?"
3. **Budget exceeded** → "Spent $20 of $30 budget, only at Phase 3. Continue?"
4. **Ambiguous validation** → "Phase score is 6.5/10. Borderline. Human judgment needed."
5. **No data available** → "Can't find avatar on Reddit/Twitter. Where else should I look?"

### Manual Review Checkpoints (Optional)
Configure in research-config.json:
- `PAUSE_AFTER_PHASE_1=true` → Review market landscape before proceeding
- `PAUSE_AFTER_PHASE_2=true` → Review avatar profile before proceeding
- `PAUSE_AFTER_PHASE_3=true` → Review differentiation before proceeding
- etc.

---

## Budget Tracking

**Time Budget**: {{MAX_HOURS}} hours total
**Cost Budget**: ${{MAX_COST}} total

Track spend by phase:
- Phase 1: 2h, $0
- Phase 2: 4h, $20
- Phase 3: 3h, $10
- Phase 4: 2h, $0
- Phase 5: 3h, $10
- Phase 6: 1h, $0
- **Total**: 15h, $40

Stop execution if budget exceeded (unless configured otherwise).

---

## Notes for Claude Code Execution

When executing this PRD:
1. Work through phases sequentially, never skip ahead
2. Save ALL outputs to specified file paths
3. Use validation agents to check your work at each phase
4. If validation fails, document why and suggest remediation
5. Pause for human review when configured or when hitting stop criteria
6. Generate comprehensive reports (not summaries) for deliverables
7. Use verbatim quotes from research (critical for authenticity)
8. Show your work (include sources, calculations, assumptions)

Let's validate this market opportunity! 🚀
```

### Task 2.3: Create validation-report-template.md

**File location**: `templates/validation-report-template.md`

**Full contents to include**:
```markdown
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
- [✅/❌] Task {{N}}.1: {{DESCRIPTION}}
- [✅/❌] Task {{N}}.2: {{DESCRIPTION}}
- [✅/❌] Task {{N}}.3: {{DESCRIPTION}}
- [✅/❌] Task {{N}}.4: {{DESCRIPTION}}
- [✅/❌] Task {{N}}.5: {{DESCRIPTION}}

### Tasks Not Completed (if any)
- Task {{N}}.X: {{DESCRIPTION}}
  - **Reason**: [Why this wasn't completed]
  - **Impact**: [Does this affect validation?]

---

## Validation Criteria Results

### Criterion 1: {{CRITERION_DESCRIPTION}}
- **Status**: [✅ PASS / ❌ FAIL]
- **Finding**: [What we discovered - be specific with numbers/data]
- **Evidence**: [Where did this come from? Sources/links]
- **Pass/Fail Reasoning**: [Why it passed or failed]

### Criterion 2: {{CRITERION_DESCRIPTION}}
- **Status**: [✅ PASS / ❌ FAIL]
- **Finding**: [What we discovered]
- **Evidence**: [Sources]
- **Pass/Fail Reasoning**: [Why]

### Criterion 3: {{CRITERION_DESCRIPTION}}
- **Status**: [✅ PASS / ❌ FAIL]
- **Finding**: [What we discovered]
- **Evidence**: [Sources]
- **Pass/Fail Reasoning**: [Why]

### Criterion 4: {{CRITERION_DESCRIPTION}} (if applicable)
- **Status**: [✅ PASS / ❌ FAIL]
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

### ✅ If PASS:

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

### ❌ If FAIL:

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

### ⚠️ If NEEDS REVIEW:

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

*This validation report was generated automatically by the Market Research Engine.*
*For questions about methodology, see `/docs/PHASE-GUIDE.md`*
```

### Validation
- [ ] All three templates created with COMPLETE content (not placeholders)
- [ ] Templates use {{VARIABLES}} for dynamic content
- [ ] Clear instructions embedded in templates
- [ ] Templates are properly markdown-formatted
- [ ] Examples provided inline for clarity

---

## PHASE 3: Create Validator Agents

### Task 3.1: Create market-validator.md

**File location**: `agents/market-validator.md`

**Full contents**: [Include the complete market validator agent content from earlier in this PRD]

### Task 3.2: Create avatar-validator.md

**File location**: `agents/avatar-validator.md`

**Full contents**: [Include the complete avatar validator agent content]

### Task 3.3: Create pricing-validator.md

**File location**: `agents/pricing-validator.md`

**Full contents**: [Include the complete pricing validator agent content]

### Task 3.4: Create gtm-validator.md

**File location**: `agents/gtm-validator.md`

**Full contents**: [Include the complete GTM validator agent content]

### Validation
- [ ] All four validator agents created
- [ ] Each has clear pass/fail/needs-review criteria
- [ ] Each asks probing validation questions
- [ ] Each has specific decision framework
- [ ] Agents are skeptical/rigorous (not rubber stamps)

---

## PHASE 4: Create Orchestrator Script

### Task 4.1: Create orchestrator.sh

**File location**: `orchestrator.sh`

**Full shell script contents**:
```bash
#!/bin/bash

# Market Research Engine Orchestrator
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
    
    claude "$PROJECT_DIR" <<EOF
Read research-prd.md and focus on PHASE $phase: $phase_name.

Execute all tasks listed for this phase:
1. Complete each checklist item
2. Use the specified data collection methods
3. Save all outputs to the specified file locations
4. Generate comprehensive reports (not summaries)

After completing all tasks:
1. Read the appropriate validator agent from /agents/
2. Validate your findings against the criteria
3. Generate validation report in checkpoints/phase${phase}-validation.md
4. Use the validation-report-template.md as the structure

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
    
    # Parse validation result
    if grep -q "VALIDATION RESULT: PASS" "$validation_file"; then
        log_success "Phase $phase validation: PASS"
        return 0
    elif grep -q "VALIDATION RESULT: FAIL" "$validation_file"; then
        log_error "Phase $phase validation: FAIL"
        return 1
    elif grep -q "VALIDATION RESULT: NEEDS REVIEW" "$validation_file"; then
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
1. Re-validate against the criteria
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
    grep "Questions for Human:" -A 5 "$validation_file" | sed 's/^/  /'
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
            # Update validation file to PASS
            sed -i '' 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: PASS (human approved)/' "$validation_file"
            return 0
            ;;
        2)
            log_warning "Human marked as FAIL: attempting remediation"
            sed -i '' 's/VALIDATION RESULT: NEEDS REVIEW/VALIDATION RESULT: FAIL (human decision)/' "$validation_file"
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
            hours=$(grep "Time Spent:" "$validation_file" | grep -o '[0-9.]*' || echo "0")
            cost=$(grep "Cost Spent:" "$validation_file" | grep -o '[0-9.]*' || echo "0")
            
            total_hours=$(echo "$total_hours + $hours" | bc)
            total_cost=$(echo "$total_cost + $cost" | bc)
        fi
    done
    
    log_info "Budget used: ${total_hours}h / $${total_cost}"
    
    # Check against config limits (simplified)
    # You could make this more sophisticated by reading from config JSON
}

# ===== FINAL SYNTHESIS =====

run_synthesis() {
    log_header "FINAL SYNTHESIS"
    log_info "All phases passed! Generating final recommendation..."
    
    # Create deliverables directory
    mkdir -p "$PROJECT_DIR/deliverables"
    
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
    echo -e "${GREEN}  Market Research Complete! 🎉${NC}"
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
    log_header "Market Research Engine v1.0"
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
```

**Make executable**:
```bash
chmod +x orchestrator.sh
```

### Task 4.2: Create helper scripts

**reddit-search.sh**: Simple Reddit search wrapper
**competitor-finder.sh**: Google search helper
**validation-checker.sh**: Parse validation markdown

(These can be simple stubs for now - the orchestrator is the main piece)

### Validation
- [ ] orchestrator.sh created and executable (`chmod +x`)
- [ ] Script has clear logging with colors
- [ ] Script handles all validation outcomes (PASS/FAIL/NEEDS REVIEW)
- [ ] Script implements remediation logic
- [ ] Script requests human review when needed
- [ ] Error handling is robust

---

## PHASE 5: Create Example Project (QuickRephrase)

### Task 5.1: Create intake.md for QuickRephrase

**File location**: `projects/quickrephrase/intake.md`

**Full contents**:
```markdown
# Market Research Intake: QuickRephrase

## Basic Info
**App Name**: QuickRephrase
**One-Line Description**: Instant AI text transformation without leaving your current app
**Your Role**: Founder & Developer
**Date**: 2026-01-14

## The Problem (in your words)
I constantly need to rephrase text when writing emails, Slack messages, tweets, and content. The current workflow is terrible:

1. Write something that sounds wrong (too formal, too casual, too long)
2. Realize I need to fix it
3. Open a new tab
4. Go to ChatGPT
5. Copy the text
6. Paste into ChatGPT
7. Wait for response
8. Copy the result
9. Go back to original tab
10. Paste the rewritten text
11. Format it to match
12. Continue writing

This takes 2-3 minutes EVERY time and breaks my flow completely. I do this 5-10 times per day, which means I waste 10-30 minutes daily just switching between apps.

The exact phrase I say to myself: "Ugh, this sounds like a robot wrote it" or "I need to make this more casual" or "This is way too long."

## Target Avatar (your hypothesis)
**Who**: Mac users who write content daily - specifically developers, founders, content creators, and marketers who care about how their writing sounds

**Where they are**: 
- r/productivity (3M members)
- r/MacApps (185K members)
- r/SideProject (220K members)
- Twitter #MacProductivity
- Indie Hackers
- Product Hunt

**What they currently use**: 
- ChatGPT (manual tab switching)
- TextExpander (but no AI - just static snippets)
- Grammarly (grammar only, not rephrasing)
- Alfred workflows (clunky, not AI-powered)

**Why they'd care**: 
- Saves 10-30 min/day (worth $25-75/day at $150/hr rate)
- Keeps them in flow (no tab switching)
- Makes writing feel effortless
- Looks professional without effort

## Your Unique Approach
**What makes you different**: AI-powered text transformation at the exact point of writing. Select text → right-click (or keyboard shortcut) → instant transformation. No app switching, no copy-paste, no waiting.

**Why this matters**: 
1. Speed: 5 seconds vs. 2 minutes (24x faster)
2. Flow: Stay in current app vs. context switching
3. Simplicity: One action vs. 11-step workflow
4. Integration: Works everywhere (Gmail, Slack, Notion, any text field)

Current solutions are either:
- AI-powered but require app switching (ChatGPT)
- Integrated but not AI (TextExpander, Alfred)
- Grammar-focused not rewriting (Grammarly)

We're the ONLY solution that's both AI-powered AND integrated at point of writing.

## Initial Assumptions (we'll validate these)
- **Market size**: $50-100M TAM (Mac productivity tools market)
- **Willingness to pay**: $29-$47 one-time purchase (comparable to PopClip $15, Alfred Powerpack $34)
- **Competitive advantage**: 10x faster workflow, first-mover in "AI at point of writing"
- **Time to build MVP**: 2 weeks (macOS app with context menu + keyboard shortcut + 5 transform types)
- **Path to first 100 customers**: Reddit posts (r/MacApps, r/productivity), Product Hunt launch, Twitter demo threads

## Research Priorities (what you most want to know)
1. **Is the "flow breaking" pain real for others or just me?** Do other people hate the ChatGPT tab-switching workflow?
2. **How much would they actually pay?** Is $47 too high? Would they prefer $19? Subscription vs. one-time?
3. **Will TextExpander/Alfred/competitors add AI soon?** Are we in a race? Do we have 6 months or 6 weeks before they catch up?
4. **Can I reach enough people organically?** Or will I need paid ads (which would kill economics)?

## Constraints
**Time budget**: 15 hours max for research
**Money budget**: $50 max (API/scraping tools)
**Launch timeline**: Want to decide GO/NO-GO within 1 week (by Jan 21, 2026)
**Risk tolerance**: Medium - willing to spend 2 weeks building if research is positive, but not 2 months if it's unclear

## What success looks like
After research, I want to know:
- [ ] Clear answer: should I build this? (GO/NO-GO with confidence score)
- [ ] If GO: what's the exact positioning, pricing ($29 vs $47?), and launch strategy?
- [ ] If NO-GO: why not and what should I pivot to? (Maybe different avatar? Different problem?)

---

## Notes for Research System
- Focus on Mac users initially (Windows version can be Phase 2)
- Don't research mobile (not relevant for this workflow)
- Pay special attention to competitor timing (threat of incumbents adding AI)
- I'm the avatar myself (can self-interview), but need external validation from 5-10 others
```

### Task 5.2: Generate research-prd.md from intake

Use Claude Code to generate this automatically:
```bash
claude projects/quickrephrase <<EOF
Read intake.md.
Read ../../templates/research-prd-template.md.
Generate a customized research-prd.md by:
1. Replacing all {{VARIABLES}} with data from intake.md
2. Keeping all phase structures intact
3. Customizing research tasks based on the specific app (QuickRephrase)
4. Save to research-prd.md
EOF
```

### Task 5.3: Create folder structure

```bash
cd projects/quickrephrase
mkdir -p checkpoints
mkdir -p research/{phase1,phase2,phase3,phase4,phase5}
mkdir -p deliverables
```

### Validation
- [ ] QuickRephrase intake.md is complete and realistic
- [ ] Research PRD generated from template
- [ ] All subdirectories created
- [ ] Project is ready for orchestrator execution

---

## PHASE 6: Create Documentation

### Task 6.1: Create README.md

**File location**: `README.md`

**Full contents**:
```markdown
# Market Research Engine (MRE)

> Autonomous market validation system that executes research phases and produces GO/NO-GO decisions for product ideas.

**Built with**: Claude Code + Ralph-style execution loops

---

## 🚀 Quick Start

### 1. Fill out intake form (5 minutes)
```bash
cp templates/project-intake-form.md projects/my-app/intake.md
# Edit with your app details
```

### 2. Generate research PRD
```bash
claude-code projects/my-app <<EOF
Read intake.md
Generate research-prd.md using ../../templates/research-prd-template.md
Save to research-prd.md
EOF
```

### 3. Execute research (2-15 hours autonomous)
```bash
./orchestrator.sh projects/my-app
```

### 4. Review results
```bash
cat projects/my-app/deliverables/GO-NO-GO-DECISION.md
```

---

## 📦 What You Get

After execution (2-15 hours depending on config):

- ✅ **Market landscape analysis**: Competitors, TAM, trends
- ✅ **Avatar validation**: Pain points, verbatim quotes, profile
- ✅ **Competitive positioning**: Differentiation, unique mechanism
- ✅ **Pricing strategy**: Models, economics, unit metrics
- ✅ **GTM strategy**: Channels, CAC, launch plan
- ✅ **Final recommendation**: GO/NO-GO with confidence score

---

## ⚙️ Configuration

Edit `config/research-config.json`:

```json
{
  "max_time_hours": 15,
  "max_cost_dollars": 50,
  "pause_after_each_phase": false,
  "auto_remediation_attempts": 2,
  "stop_on_fail_threshold": "any_must_have"
}
```

---

## 📋 System Requirements

- ✅ Claude Code CLI installed
- ✅ Bash shell (Mac/Linux)
- Optional: API keys for Reddit, Apify (for enhanced research)

---

## 📚 Examples

See `projects/quickrephrase/` for a complete worked example.

---

## 🏗️ Architecture

```
ralph-search/
├── orchestrator.sh       # Main loop (like Ralph for research)
├── templates/            # Reusable templates for PRDs and reports
├── agents/               # Validator agents (market, avatar, pricing, GTM)
├── tools/                # Helper scripts for research tasks
└── projects/             # Your app research projects
    └── [app-name]/
        ├── intake.md           # Your initial brief (5 min to fill out)
        ├── research-prd.md     # Generated research plan
        ├── checkpoints/        # Validation reports per phase
        ├── research/           # Raw data collected
        └── deliverables/       # Final reports
```

---

## 🔬 Research Phases

### Phase 1: Market Landscape Scan
- Find 20 competitors (direct + indirect)
- Calculate TAM (Total Addressable Market)
- Analyze pricing models
- Assess market growth trends

### Phase 2: Avatar Pain Mining
- Scrape 500+ posts/comments from target communities
- Extract 50+ verbatim pain quotes
- Cluster pain themes
- Document current workarounds
- Calculate economic cost of problem

### Phase 3: Competitive Differentiation
- Build feature comparison matrix
- Analyze 200+ competitor reviews
- Identify gaps in market
- Define unique positioning
- Assess how easily competitors can copy

### Phase 4: Pricing & Economics
- Analyze competitor pricing
- Calculate LTV:CAC ratio
- Model 3 scenarios (conservative/realistic/optimistic)
- Validate unit economics
- Choose business model (one-time/subscription/usage)

### Phase 5: Go-To-Market Strategy
- Identify specific communities where avatar exists
- Estimate CAC per channel
- Design launch sequence
- Map partnership opportunities
- Calculate path to first 100 customers

### Phase 6: Final Synthesis
- Compile all findings
- Score each phase
- Calculate weighted overall score
- Generate GO/NO-GO recommendation
- Provide next steps or pivot suggestions

**Each phase must PASS validation before proceeding.**

---

## 🛑 When Research Stops

The system will automatically stop if:
- Any phase fails validation after 2 remediation attempts
- Budget (time/cost) is exceeded
- Human reviewer decides to stop
- "Must-have" criteria can't be satisfied

---

## 🤔 Troubleshooting

### "Phase fails validation"
→ Check `checkpoints/phaseN-validation.md` for detailed failure reasons

### "Can't find enough data"
→ May need API keys for web scraping (Reddit, Apify)
→ Try different search terms or communities

### "Script errors"
→ Ensure Claude Code CLI is in PATH: `which claude`
→ Check file permissions: `chmod +x orchestrator.sh`

### "Validation is borderline"
→ System will pause and request human review
→ You'll be asked to approve/reject/stop

---

## 🎯 Best Practices

1. **Be specific in intake form**: "Mac developers" not "developers"
2. **Set realistic budgets**: 15 hours is usually sufficient
3. **Trust the validators**: They're intentionally skeptical
4. **Review checkpoints**: Don't just skip to final decision
5. **Run multiple projects**: Compare opportunities side-by-side

---

## 🔄 Workflow Example

```bash
# Monday morning: Set up 3 app ideas
cp templates/project-intake-form.md projects/app1/intake.md
cp templates/project-intake-form.md projects/app2/intake.md
cp templates/project-intake-form.md projects/app3/intake.md
# Fill out all three (15 minutes each)

# Monday afternoon: Start research
./orchestrator.sh projects/app1 &
./orchestrator.sh projects/app2 &
./orchestrator.sh projects/app3 &

# Tuesday morning: Review results
cat projects/app1/deliverables/GO-NO-GO-DECISION.md
cat projects/app2/deliverables/GO-NO-GO-DECISION.md
cat projects/app3/deliverables/GO-NO-GO-DECISION.md

# Pick the winner and start building!
```

---

## 📖 Learn More

- **Usage Guide**: See `docs/USAGE.md` for step-by-step walkthrough
- **Phase Deep-Dive**: See `docs/PHASE-GUIDE.md` for methodology details
- **Examples**: See `docs/EXAMPLES.md` for more worked examples

---

## 🙏 Credits

Inspired by:
- **Ralph** (autonomous coding agent by studioorange-ai)
- **Alex Hormozi** ($100M Offers framework)
- **Russell Brunson** (Value Ladder & DotCom Secrets)
- **Claude Code** (autonomous research executor)

---

## 📄 License

MIT License - fork and customize as needed!

---

**Built by Chris for validating indie app ideas before wasting months building the wrong thing.**

*Have questions? Found a bug? Want to share results? Open an issue!*
```

### Task 6.2: Create USAGE.md

**File location**: `docs/USAGE.md`

Brief version (you can expand this):
```markdown
# Market Research Engine: Usage Guide

## Step-by-Step Walkthrough

[Detailed tutorial with examples, screenshots (if applicable), common pitfalls, etc.]

## Setting Up Your First Project

[Step-by-step instructions]

## Reading Validation Reports

[How to interpret PASS/FAIL/NEEDS REVIEW]

## Making GO/NO-GO Decisions

[How to use the final reports]

## Tips & Tricks

[Power user features, shortcuts, advanced configuration]
```

### Task 6.3: Create PHASE-GUIDE.md

**File location**: `docs/PHASE-GUIDE.md`

Brief version:
```markdown
# Phase-by-Phase Guide

## Phase 1: Market Landscape Scan

**Purpose**: [Why we do this]
**What we're looking for**: [Success criteria explained]
**Common outcomes**: [Examples of PASS vs FAIL]
**Red flags**: [What indicates bad market]

[Repeat for all 6 phases...]
```

### Validation
- [ ] README.md is comprehensive and clear
- [ ] Usage guide provides step-by-step instructions
- [ ] Phase guide explains methodology
- [ ] Documentation includes examples
- [ ] Troubleshooting section is helpful

---

## PHASE 7: Test the System

### Task 7.1: Dry run with QuickRephrase

Execute the full research loop:
```bash
./orchestrator.sh projects/quickrephrase
```

### Task 7.2: Validate outputs

Check that all expected files are created:
- [ ] 5 phase validation reports in checkpoints/
- [ ] Research artifacts in research/phase1-5/
- [ ] Final deliverables in deliverables/
- [ ] Files are comprehensive (not empty stubs)

### Task 7.3: Review quality

Manually review generated GO/NO-GO decision:
- [ ] Does the recommendation make sense?
- [ ] Is reasoning clear and data-driven?
- [ ] Are next steps actionable?
- [ ] Would this help someone make a real decision?

### Task 7.4: Document any issues

If tests reveal problems:
- [ ] Document what failed
- [ ] Fix bugs in orchestrator.sh or templates
- [ ] Re-test until working end-to-end

### Validation
- [ ] System executes end-to-end without errors
- [ ] All outputs are generated correctly
- [ ] Decision quality is high
- [ ] No major bugs found

---

## FINAL DELIVERABLES CHECKLIST

After all 7 phases complete, verify:

- [ ] ✅ Complete folder structure created
- [ ] ✅ All templates created with full content (not placeholders)
- [ ] ✅ Four validator agents with rigorous criteria
- [ ] ✅ Working orchestrator.sh script with error handling
- [ ] ✅ Helper tools created (even if simple)
- [ ] ✅ Fully worked QuickRephrase example
- [ ] ✅ Complete documentation (README, USAGE, PHASE-GUIDE)
- [ ] ✅ Tested end-to-end with realistic data
- [ ] ✅ Can execute: `./orchestrator.sh projects/quickrephrase`
- [ ] ✅ Produces valid GO/NO-GO decision with reasoning

---

## SUCCESS METRICS

**Can you run this command and get a useful answer?**
```bash
./orchestrator.sh projects/quickrephrase && \
cat projects/quickrephrase/deliverables/GO-NO-GO-DECISION.md
```

**If YES**: ✅ Mission accomplished!

**If NO**: ❌ Keep debugging until it works

---

## NOTES FOR CLAUDE CODE

You're building a system that will use you (Claude Code) to do research. Meta!

**Key principles**:
1. **Completeness over perfection**: Get everything working end-to-end
2. **Real content, not placeholders**: Templates should have full examples
3. **Test as you go**: Don't wait until Phase 7 to test
4. **Clear documentation**: Someone should be able to use this without you
5. **Robust error handling**: Research might fail, handle gracefully

**Special attention needed**:
- Orchestrator.sh is the most complex piece (Phase 4)
- Validator agents need to be truly rigorous (Phase 3)
- Templates must be complete with examples (Phase 2)
- QuickRephrase example proves it works (Phase 5)

**When you're done**:
The user should be able to:
1. Fill out a 5-minute intake form
2. Run `./orchestrator.sh projects/my-app`
3. Come back in a few hours to a GO/NO-GO decision
4. Actually trust the decision to invest time building (or not)

---

## LET'S BUILD THIS! 🚀

Execute all 7 phases sequentially.
Do not skip any tasks.
Generate complete files (not stubs).
Test thoroughly at Phase 7.
Report when complete.

**This is going to be awesome.**
