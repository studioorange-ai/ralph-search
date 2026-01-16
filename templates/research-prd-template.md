# Market Research PRD: {{APP_NAME}}

*Auto-generated from intake form on {{DATE}}*

## Research Mission
**Problem**: {{PROBLEM_STATEMENT}}
**Target Avatar**: {{INITIAL_AVATAR}}
**Expected Market**: {{MARKET_SIZE_GUESS}}
**Research Budget**: {{MAX_HOURS}} hours, {{MAX_COST}} dollars

## Phase Execution Rules
- Execute phases sequentially (1->2->3->4->5->6)
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
- **TAM**: (# potential customers) x (avg price) x (% addressable)
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
- [ ] 2.7: Estimate economic cost of pain (time x hourly rate or money spent)

### Data Collection Methods
- **Communities**: Reddit subreddits, Twitter hashtags, Indie Hackers, niche forums
- **Reddit**: Use Apify Reddit Scraper ($5-10) or PRAW API (free but rate-limited)
- **Twitter**: Search API for "[problem] frustrated/annoying/hate" (free tier)
- **Forums**: Manual scraping (Discourse, Slack archives if public)
- **Clustering**: Use Claude to group similar complaints into themes
- **Economic cost**: If mentioned explicitly, or calculate: (freq per week) x (time wasted) x ($100/hr estimate)

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
- **Ceiling**: Avatar's cost of problem / 3 (typical value capture rate)
- **Floor**: Lowest competitor price OR $20 (credibility threshold for software)
- **LTV**:
  - One-time: price x 1 (no recurring)
  - Subscription: price x expected years (typically 2-3 for indie tools)
  - Usage: price x expected monthly usage x retention months
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
- Score >= 8.0: **STRONG GO** (high confidence, build immediately)
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
1. **Any phase fails validation 2x** -> "I tried to remediate but couldn't. What should I do?"
2. **Conflicting data** -> "Source A says X, Source B says Y. How should I resolve?"
3. **Budget exceeded** -> "Spent $20 of $30 budget, only at Phase 3. Continue?"
4. **Ambiguous validation** -> "Phase score is 6.5/10. Borderline. Human judgment needed."
5. **No data available** -> "Can't find avatar on Reddit/Twitter. Where else should I look?"

### Manual Review Checkpoints (Optional)
Configure in research-config.json:
- `PAUSE_AFTER_PHASE_1=true` -> Review market landscape before proceeding
- `PAUSE_AFTER_PHASE_2=true` -> Review avatar profile before proceeding
- `PAUSE_AFTER_PHASE_3=true` -> Review differentiation before proceeding
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

Let's validate this market opportunity!
