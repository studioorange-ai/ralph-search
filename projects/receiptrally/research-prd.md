# Market Research PRD: ReceiptRally

*Auto-generated from intake form on 2026-01-14*

## Research Mission
**Problem**: Receipt capture and reconciliation is messy for freelancers and small agencies. Receipts are scattered across email, downloads, screenshots, and paper. Month-end cleanup takes hours and missed deductions are common.
**Target Avatar**: Freelancers, consultants, and small agencies on Mac who manage their own bookkeeping
**Expected Market**: $100-200M TAM (freelancers + small agencies doing their own expense tracking)
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
- [ ] 1.1: Find 10 direct competitors (receipt scanning and expense tracking tools)
- [ ] 1.2: Find 10 indirect competitors (spreadsheets, accounting suites, scanner apps)
- [ ] 1.3: Scrape pricing from all competitor websites
- [ ] 1.4: Estimate competitor scale (funding, employees, traffic)
- [ ] 1.5: Calculate TAM using bottoms-up approach (# freelancers x % self-managed bookkeeping x avg price)
- [ ] 1.6: Identify market growth rate (freelancer economy + expense tracking tools)

### Data Collection Methods
- **Competitors**: Search "receipt scanner app", "expense tracking for freelancers", "receipt management macOS", Product Hunt, G2, Capterra
- **Pricing**: Scrape /pricing pages for Expensify, Dext, Shoeboxed, SparkReceipt, Zoho Expense, FreshBooks
- **Scale**: LinkedIn company pages, Crunchbase (free tier), App Store review counts
- **TAM**: (US freelancers ~70M) x (% who self-manage expenses ~30%) x (avg price $50)
- **Growth**: Google Trends for "receipt scanner" and "expense tracking", freelancer market reports

### Validation Criteria (Must pass ALL)
- [ ] Found 5+ competitors with public pricing (proves market exists)
- [ ] TAM > $20M/year (big enough to pursue)
- [ ] Market growing or stable (freelancer economy expanding)
- [ ] Can identify where target avatar congregates online (r/freelance, r/smallbusiness, etc.)

### Output Files
- `research/phase1/competitor-matrix.md` (20 competitors with data)
- `research/phase1/pricing-analysis.md` (range, models, tiers)
- `research/phase1/tam-calculation.md` (with sources and assumptions)
- `research/phase1/market-trends.md` (growth indicators)
- `checkpoints/phase1-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No competitors found**: Search "receipt organizer", "expense report tool", "receipt OCR"
- **TAM too small**: Expand to small businesses or include Windows users
- **Market shrinking**: Check if full accounting suites are absorbing demand

### STOP Criteria
- Can't find ANY competitors (no market validation)
- TAM < $10M (too small even after adjustments)
- Market declining >20%/year

---

## PHASE 2: Avatar Pain Mining
**Objective**: Find verbatim evidence of pain in target avatar's own words
**Time Budget**: 4 hours
**Cost Budget**: $20 (Reddit API, scraping tools)
**Validator Agent**: avatar-validator.md

### Research Tasks
- [ ] 2.1: Identify 5-10 communities where avatar hangs out (r/freelance, r/smallbusiness, r/accounting, Indie Hackers)
- [ ] 2.2: Scrape top 500 posts/comments about receipts, expense tracking, tax prep, bookkeeping
- [ ] 2.3: Extract verbatim pain quotes (50+ quotes minimum)
- [ ] 2.4: Cluster pain themes (time waste, missing receipts, audit anxiety, data entry)
- [ ] 2.5: Identify current workarounds (spreadsheets, folders, accounting suites)
- [ ] 2.6: Calculate pain frequency (monthly/quarterly)
- [ ] 2.7: Estimate economic cost of pain (time x hourly rate + missed deductions)

### Data Collection Methods
- **Communities**: r/freelance, r/smallbusiness, r/accounting, r/Entrepreneur, Indie Hackers
- **Reddit**: Search "receipt tracking", "expense report", "tax season receipts", "bookkeeping pain"
- **Twitter/X**: Search "where are my receipts", "expense tracking is a mess"
- **Clustering**: Group complaints into themes: time, accuracy, stress, compliance
- **Economic cost**: (2-4 hrs/month) x ($75/hr) + missed deductions ($200-1000/year)

### Validation Criteria (Must pass ALL)
- [ ] Found 50+ verbatim quotes articulating the problem
- [ ] 3+ distinct pain themes emerged (proves multifaceted problem)
- [ ] Avatar uses workarounds (proves willingness to solve)
- [ ] Pain occurs monthly or more frequently (proves urgency)
- [ ] Economic cost > $200/year (proves worth paying for)

### Output Files
- `research/phase2/communities.md` (where avatar exists, with member counts and links)
- `research/phase2/pain-quotes.md` (50+ verbatim quotes with sources)
- `research/phase2/pain-themes.md` (clustered by theme, ranked by frequency)
- `research/phase2/workarounds.md` (what they currently do, how painful)
- `research/phase2/avatar-profile-v1.md` (synthesized from actual data)
- `checkpoints/phase2-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **<50 quotes**: Search different keywords ("receipt organization", "expense tracking")
- **No workarounds**: Check if people pay accountants or ignore receipts (bad sign)
- **Low frequency**: Focus on high-expense freelancers (consultants, agencies)
- **Low cost**: Emphasize missed deductions + audit risk

### STOP Criteria
- <20 quotes found after remediation (problem may not be real)
- No workarounds found (people don't care enough)
- Quarterly or less frequency (not urgent)
- Cost <$100/year (won't support $39+ pricing)

---

## PHASE 3: Competitive Differentiation Analysis
**Objective**: Find the unique angle that makes avatar choose ReceiptRally
**Time Budget**: 3 hours
**Cost Budget**: $10 (competitor research tools)
**Validator Agent**: market-validator.md + avatar-validator.md

### Research Tasks
- [ ] 3.1: Build comprehensive feature matrix (ReceiptRally vs. top 5 competitors)
- [ ] 3.2: Scrape competitor reviews (App Store, G2, Capterra, Trustpilot)
- [ ] 3.3: Identify gaps: what are they NOT solving? (lightweight local-first workflows?)
- [ ] 3.4: Analyze negative reviews: what do users hate about current solutions?
- [ ] 3.5: Map ReceiptRally's unique mechanism (auto-capture + local OCR) vs. their approach
- [ ] 3.6: Calculate "10x better" dimension (time-to-reconcile, setup time)
- [ ] 3.7: Assess copyability (can incumbents ship local-first quickly?)

### Data Collection Methods
- **Features**: Scrape product pages for Expensify, Dext, Shoeboxed, Zoho Expense, FreshBooks
- **Reviews**: App Store reviews for receipt apps; G2 reviews for expense platforms
- **Gaps**: Compare feature matrix to Phase 2 pain themes
- **Sentiment**: Identify common complaints ("too expensive", "too much setup", "privacy")
- **Unique mechanism**: "Auto-capture receipts from email/Downloads with local OCR" = key differentiator

### Validation Criteria (Must pass 3 of 4)
- [ ] ONE dimension where ReceiptRally is 10x better (reconcile in 10 min vs 2-4 hrs)
- [ ] Gap maps to HIGH-INTENSITY pain theme from Phase 2
- [ ] 20+ reviews complaining about gap we solve ("too much setup", "subscription fatigue")
- [ ] Unique mechanism defensible for 12+ months (local-first, Mac-specific)

### Output Files
- `research/phase3/feature-matrix.md` (comprehensive comparison table)
- `research/phase3/review-analysis.md` (themes from 200+ reviews)
- `research/phase3/gaps-identified.md` (what's missing in market)
- `research/phase3/positioning-statement.md` (ReceiptRally's unique angle)
- `research/phase3/defensibility-analysis.md` (how easily can they copy?)
- `checkpoints/phase3-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **No 10x dimension**: Focus on a niche (consultants, agencies, contractors)
- **Gap is low-priority pain**: Reposition around audit readiness or missed deductions
- **Easy to copy**: Lean into privacy + one-time pricing
- **Already solved**: Check if we missed a competitor

### STOP Criteria
- No 10x dimension after remediation (just another expense tracker)
- Incumbents already offer local-first, lightweight workflows
- Gap doesn't map to high-priority pain

---

## PHASE 4: Pricing & Economics Model
**Objective**: Determine optimal pricing and validate unit economics
**Time Budget**: 2 hours
**Cost Budget**: $0 (analysis only)
**Validator Agent**: pricing-validator.md

### Research Tasks
- [ ] 4.1: Analyze competitor pricing (from Phase 1)
- [ ] 4.2: Calculate avatar's current cost of problem (time + missed deductions)
- [ ] 4.3: Determine pricing ceiling (max they'd pay: cost / 3)
- [ ] 4.4: Determine pricing floor (min to be credible: $29+)
- [ ] 4.5: Choose business model (one-time vs. subscription)
- [ ] 4.6: Model 3 scenarios: conservative ($39), realistic ($49), optimistic ($69)
- [ ] 4.7: Calculate LTV for each scenario
- [ ] 4.8: Estimate CAC per channel (Reddit, Product Hunt, newsletters)
- [ ] 4.9: Validate LTV:CAC > 3:1 for realistic scenario

### Data Collection Methods
- **Ceiling**: $2,400/year time cost / 3 = $800/year max capture
- **Floor**: Comparable tools ($5-20/mo subscriptions, $39-79 one-time utilities)
- **LTV**:
  - One-time at $49: LTV = $49
  - Subscription at $6/mo: LTV = $6 x 12 x 2 years = $144
- **CAC**: Organic (Reddit, Indie Hackers) ~$5-15, Paid ~$50-100

### Validation Criteria (Must pass ALL)
- [ ] Pricing is <30% of avatar's cost of problem ($2,400 x 30% = $720 - we're at $49)
- [ ] LTV:CAC ratio > 3:1 in realistic scenario ($49 / $12 = 4.1x for organic)
- [ ] Business model matches avatar buying psychology (freelancers prefer one-time tools)
- [ ] Gross margin > 70% at scale (OCR costs minimal, local-first)

### Output Files
- `research/phase4/pricing-analysis.md` (competitive benchmarks)
- `research/phase4/scenarios.md` (3 pricing models with projections)
- `research/phase4/unit-economics.md` (LTV, CAC, margin calculations with assumptions)
- `research/phase4/recommended-pricing.md` (final recommendation with reasoning)
- `checkpoints/phase4-validation.md` (PASS/FAIL + reasoning)

### If FAIL - Remediation Strategies
- **ROI unclear**: Lower price to $39 (clearer impulse buy)
- **LTV:CAC < 3:1**: Focus exclusively on organic channels
- **Model mismatch**: Test one-time vs subscription with landing page
- **Low margin**: Use on-device OCR, avoid API costs

### STOP Criteria
- LTV:CAC < 2:1 (can't make economics work organically)
- Margin < 50% (costs too high)
- No clear ROI for avatar

---

## PHASE 5: Go-To-Market Strategy
**Objective**: Identify viable acquisition channels and launch strategy
**Time Budget**: 3 hours
**Cost Budget**: $10 (community research)
**Validator Agent**: gtm-validator.md

### Research Tasks
- [ ] 5.1: List ALL communities where avatar exists (from Phase 2)
- [ ] 5.2: Analyze successful bookkeeping or freelancer tool launches in those communities
- [ ] 5.3: Estimate organic reach per channel
- [ ] 5.4: Estimate CAC per channel (organic + paid)
- [ ] 5.5: Identify content strategy (tax season checklists, "receipt cleanup" demos)
- [ ] 5.6: Map partnership/integration opportunities (accountants, QuickBooks, Wave)
- [ ] 5.7: Design launch sequence (beta -> tax season -> ongoing content)
- [ ] 5.8: Calculate path to first 100 customers

### Data Collection Methods
- **Communities**:
  - r/freelance: ~1.5M members
  - r/smallbusiness: ~2M members
  - Indie Hackers: ~200K members
  - Accountant newsletters + YouTube channels
- **Successful launches**: Search for bookkeeping tools and freelancer utilities on Product Hunt
- **CAC estimates**:
  - Reddit (organic): $0-10 per customer
  - Product Hunt: $5-20 per customer
  - Newsletter sponsorships: $20-60 per customer
- **Partnerships**: Accountant firms, bookkeeping services, tool marketplaces

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
- **CAC too high**: Focus on Product Hunt + Reddit only
- **Can't reach avatar**: Consider accountant partnerships or tax season SEO
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
- ReceiptRally is differentiated (Phase 3 PASS)
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

Let's validate ReceiptRally!
