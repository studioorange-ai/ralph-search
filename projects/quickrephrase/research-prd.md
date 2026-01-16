# Market Research PRD: QuickRephrase

*Auto-generated from intake form on 2026-01-14*

## Research Mission
**Problem**: Flow-breaking workflow when rephrasing text - current process requires 11 steps and 2-3 minutes of app switching between writing context and ChatGPT
**Target Avatar**: Mac users who write content daily - developers, founders, content creators, and marketers who care about how their writing sounds
**Expected Market**: $50-100M TAM (Mac productivity tools market)
**Research Budget**: 15 hours, $50 dollars

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
- [ ] 1.1: Find 10 direct competitors (AI writing assistants, text transformation tools)
- [ ] 1.2: Find 10 indirect competitors (TextExpander, Alfred, Grammarly, clipboard managers)
- [ ] 1.3: Scrape pricing from all competitor websites
- [ ] 1.4: Estimate competitor scale (funding, employees, traffic)
- [ ] 1.5: Calculate TAM using bottoms-up approach (# Mac power users x avg price)
- [ ] 1.6: Identify market growth rate (AI writing tools trend 2023-2026)

### Data Collection Methods
- **Competitors**: Search "AI text rewriter Mac", "text transformation tool", "writing assistant macOS", Product Hunt, G2, Capterra
- **Pricing**: Scrape /pricing pages, App Store listings, create pricing-data.json
- **Scale**: Use LinkedIn company pages, Crunchbase (free tier), App Store review counts
- **TAM**: (# Mac users in US ~100M) x (% power users ~10%) x (% who write daily ~20%) x (avg price $35)
- **Growth**: Google Trends for "AI writing assistant", VC funding in writing tools

### Validation Criteria (Must pass ALL)
- [ ] Found 5+ competitors with public pricing (proves market exists)
- [ ] TAM > $10M/year (big enough to pursue)
- [ ] Market growing or stable (AI writing tools growing rapidly)
- [ ] Can identify where target avatar congregates online (r/MacApps, r/productivity, etc.)

### Output Files
- `research/phase1/competitor-matrix.md` (20 competitors with data)
- `research/phase1/pricing-analysis.md` (range, models, tiers)
- `research/phase1/tam-calculation.md` (with sources and assumptions)
- `research/phase1/market-trends.md` (growth indicators)
- `checkpoints/phase1-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No competitors found**: Search "text rewriter", "paraphrasing tool", "writing assistant"
- **TAM too small**: Include Windows market, or target enterprise users
- **Market shrinking**: Check if ChatGPT is making standalone tools obsolete

### STOP Criteria
- Can't find ANY competitors (no market validation)
- TAM < $5M (too small even after adjustments)
- Market declining >20%/year (ChatGPT eating everything)

---

## PHASE 2: Avatar Pain Mining
**Objective**: Find verbatim evidence of pain in target avatar's own words
**Time Budget**: 4 hours
**Cost Budget**: $20 (Reddit API, scraping tools)
**Validator Agent**: avatar-validator.md

### Research Tasks
- [ ] 2.1: Identify 5-10 communities where avatar hangs out (r/productivity, r/MacApps, r/SideProject, Indie Hackers, Twitter)
- [ ] 2.2: Scrape top 500 posts/comments about text rephrasing, writing workflow, ChatGPT friction
- [ ] 2.3: Extract verbatim pain quotes (50+ quotes minimum)
- [ ] 2.4: Cluster pain themes (what hurts most? - flow breaking, time waste, quality, etc.)
- [ ] 2.5: Identify current workarounds (ChatGPT tab, Alfred workflows, TextExpander hacks)
- [ ] 2.6: Calculate pain frequency (daily/weekly/monthly)
- [ ] 2.7: Estimate economic cost of pain (time x hourly rate)

### Data Collection Methods
- **Communities**: r/productivity (3M), r/MacApps (185K), r/SideProject (220K), Indie Hackers, Twitter #MacProductivity
- **Reddit**: Search "ChatGPT copy paste annoying", "text rewriter workflow", "AI writing frustrating"
- **Twitter**: Search "chatgpt workflow broken", "wish ai could", "hate switching tabs"
- **Clustering**: Group complaints into themes: speed, flow, quality, integration
- **Economic cost**: (5-10 times/day) x (2-3 min) x ($100/hr) = $2-5/day = $500-1000/year

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
- **<50 quotes**: Search different keywords ("rewrite text", "paraphrase", "writing tool")
- **No workarounds**: Check if people just use ChatGPT and don't complain (bad sign)
- **Low frequency**: Target power users only (writers, marketers)
- **Low cost**: Target higher-earning professionals ($200/hr+)

### STOP Criteria
- <20 quotes found after remediation (problem may not be real outside of founder's head)
- No workarounds found (people don't care enough)
- Monthly or less frequency (not urgent)
- Cost <$50/year (won't support $35+ pricing)

---

## PHASE 3: Competitive Differentiation Analysis
**Objective**: Find the unique angle that makes avatar choose QuickRephrase
**Time Budget**: 3 hours
**Cost Budget**: $10 (competitor research tools)
**Validator Agent**: market-validator.md + avatar-validator.md

### Research Tasks
- [ ] 3.1: Build comprehensive feature matrix (QuickRephrase vs. top 5 competitors)
- [ ] 3.2: Scrape competitor reviews (App Store, G2, Capterra, Trustpilot)
- [ ] 3.3: Identify gaps: what are they NOT solving? (integration at point of writing?)
- [ ] 3.4: Analyze negative reviews: what do users hate about current solutions?
- [ ] 3.5: Map QuickRephrase's unique mechanism (context menu AI) vs. their approach
- [ ] 3.6: Calculate "10x better" dimension (speed? integration? simplicity?)
- [ ] 3.7: Assess copyability (can TextExpander/Alfred add this in 6 months?)

### Data Collection Methods
- **Features**: Scrape product pages for Grammarly, TextExpander, Quillbot, Wordtune, WriteSonic
- **Reviews**: App Store reviews for Grammarly Mac, TextExpander; G2 for Quillbot
- **Gaps**: Compare feature matrix to Phase 2 pain themes
- **Sentiment**: Identify common complaints ("slow", "requires browser", "breaks workflow")
- **Unique mechanism**: "AI transformation without leaving current app" = key differentiator

### Validation Criteria (Must pass 3 of 4)
- [ ] ONE dimension where QuickRephrase is 10x better (speed: 5 sec vs 2 min = 24x)
- [ ] Gap maps to HIGH-INTENSITY pain theme from Phase 2
- [ ] 20+ reviews complaining about gap we solve ("hate switching apps", "breaks flow")
- [ ] Unique mechanism defensible for 12+ months (first-mover, macOS-specific integration hard to replicate)

### Output Files
- `research/phase3/feature-matrix.md` (comprehensive comparison table)
- `research/phase3/review-analysis.md` (themes from 200+ reviews)
- `research/phase3/gaps-identified.md` (what's missing in market)
- `research/phase3/positioning-statement.md` (QuickRephrase's unique angle)
- `research/phase3/defensibility-analysis.md` (how easily can they copy?)
- `checkpoints/phase3-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No 10x dimension**: Focus on niche (Mac-only, developers-only)
- **Gap is low-priority pain**: Reposition around different pain theme
- **Easy to copy**: Move faster - launch within 2 weeks, build audience
- **Already solved**: Check if we missed a competitor

### STOP Criteria
- No 10x dimension after remediation (we're just another AI writer)
- TextExpander/Alfred already shipping AI features (too late)
- Gap doesn't map to high-priority pain

---

## PHASE 4: Pricing & Economics Model
**Objective**: Determine optimal pricing and validate unit economics
**Time Budget**: 2 hours
**Cost Budget**: $0 (analysis only)
**Validator Agent**: pricing-validator.md

### Research Tasks
- [ ] 4.1: Analyze competitor pricing (from Phase 1)
- [ ] 4.2: Calculate avatar's current cost of problem (from Phase 2: ~$500-1000/year)
- [ ] 4.3: Determine pricing ceiling (max they'd pay: ~$150-300/year value / 3 = $50-100)
- [ ] 4.4: Determine pricing floor (min to be credible: $20+)
- [ ] 4.5: Choose business model (one-time vs. subscription - research Mac user preferences)
- [ ] 4.6: Model 3 scenarios: conservative ($29), realistic ($39), optimistic ($49)
- [ ] 4.7: Calculate LTV for each scenario
- [ ] 4.8: Estimate CAC per channel (Reddit: ~$5, Product Hunt: ~$10, Paid: ~$50)
- [ ] 4.9: Validate LTV:CAC > 3:1 for realistic scenario

### Data Collection Methods
- **Ceiling**: $500-1000/year cost / 3 = $165-333/year max capture
- **Floor**: Comparable apps (PopClip $15, Alfred Powerpack $34, Raycast Pro $8/mo)
- **LTV**:
  - One-time at $39: LTV = $39 (no recurring, but also no churn)
  - Subscription at $8/mo: LTV = $8 x 12 x 2 years = $192 (but harder sell on Mac)
- **CAC**: Organic (Reddit, Product Hunt) ~$5-10, Paid ~$50-100

### Validation Criteria (Must pass ALL)
- [ ] Pricing is <30% of avatar's cost of problem ($500 x 30% = $150 - we're at $39, good)
- [ ] LTV:CAC ratio > 3:1 in realistic scenario ($39 / $10 = 3.9x for organic)
- [ ] Business model matches avatar buying psychology (Mac users prefer one-time for utilities)
- [ ] Gross margin > 70% at scale (API costs ~$0.01/transform, hosting minimal)

### Output Files
- `research/phase4/pricing-analysis.md` (competitive benchmarks)
- `research/phase4/scenarios.md` (3 pricing models with projections)
- `research/phase4/unit-economics.md` (LTV, CAC, margin calculations with assumptions)
- `research/phase4/recommended-pricing.md` (final recommendation with reasoning)
- `checkpoints/phase4-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **ROI unclear**: Lower price to $29 (clearer impulse buy)
- **LTV:CAC < 3:1**: Focus exclusively on organic channels
- **Model mismatch**: Test both one-time and subscription with landing page
- **Low margin**: Use cheaper AI model (GPT-3.5 vs GPT-4) for basic transforms

### STOP Criteria
- LTV:CAC < 2:1 (can't make economics work organically)
- Margin < 50% (API costs too high)
- No clear ROI for avatar

---

## PHASE 5: Go-To-Market Strategy
**Objective**: Identify viable acquisition channels and launch strategy
**Time Budget**: 3 hours
**Cost Budget**: $10 (community research)
**Validator Agent**: gtm-validator.md

### Research Tasks
- [ ] 5.1: List ALL communities where avatar exists (from Phase 2)
- [ ] 5.2: Analyze successful Mac app launches in those communities (what worked?)
- [ ] 5.3: Estimate organic reach per channel
- [ ] 5.4: Estimate CAC per channel (organic + paid)
- [ ] 5.5: Identify content strategy (demo videos, "how I use AI to write" threads)
- [ ] 5.6: Map partnership/integration opportunities (Raycast extension? Alfred workflow?)
- [ ] 5.7: Design launch sequence (beta -> Product Hunt -> sustained content)
- [ ] 5.8: Calculate path to first 100 customers

### Data Collection Methods
- **Communities**:
  - r/MacApps: 185K members, ~5% see top posts = 9K reach
  - r/productivity: 3M members, ~1% see posts = 30K reach
  - Product Hunt: Featured = 20-50K views
  - Twitter #MacProductivity: Variable, depends on following
- **Successful launches**: Search for Raycast, Arc, CleanShot launches - analyze tactics
- **CAC estimates**:
  - Reddit (organic): $0-5 per customer (high effort, low cost)
  - Product Hunt: $5-15 per customer (one-shot but high volume)
  - Twitter: $10-30 per customer (requires audience building)
- **Partnerships**: Raycast extension store, SetApp, MacStories review

### Validation Criteria (Must pass 3 of 4)
- [ ] Identified 2+ channels with estimated CAC < $50
- [ ] Can reach 1,000+ avatars organically within 30 days
- [ ] Found 3+ recent successful launches to learn from (Raycast, CleanShot, Arc)
- [ ] Clear path to first 100 customers within 90 days

### Output Files
- `research/phase5/channel-analysis.md` (all channels ranked by feasibility)
- `research/phase5/launch-playbook.md` (week-by-week plan)
- `research/phase5/content-strategy.md` (what to create, where to post)
- `research/phase5/partnerships.md` (integration opportunities)
- `research/phase5/first-100-plan.md` (specific tactics to get initial traction)
- `checkpoints/phase5-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **CAC too high**: Focus on Product Hunt + Reddit only (highest ROI for indie)
- **Can't reach avatar**: Consider influencer partnerships (Mac YouTube channels)
- **No recent successes**: Study older launches, accept higher risk
- **Path to 100 unclear**: Start with beta waitlist to validate interest first

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
- QuickRephrase is differentiated (Phase 3 PASS)
- Economics work (Phase 4 PASS)
- Can reach avatar (Phase 5 PASS)

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
3. **Budget exceeded** -> "Spent $30 of $50 budget, only at Phase 3. Continue?"
4. **Ambiguous validation** -> "Phase score is 6.5/10. Borderline. Human judgment needed."
5. **No data available** -> "Can't find avatar discussing this on Reddit. Where else should I look?"

### Manual Review Checkpoints (Optional)
Configure in research-config.json:
- `PAUSE_AFTER_PHASE_1=true` -> Review market landscape before proceeding
- `PAUSE_AFTER_PHASE_2=true` -> Review avatar profile before proceeding
- `PAUSE_AFTER_PHASE_3=true` -> Review differentiation before proceeding
- etc.

---

## Budget Tracking

**Time Budget**: 15 hours total
**Cost Budget**: $50 total

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

Let's validate QuickRephrase!
