# Ralph Search Examples

This document provides additional examples of how to use Ralph Search for different types of products.

---

## Example 1: ReceiptRally (included)

**Type**: Freelancer utility app (B2C)
**Location**: `projects/receiptrally/`

This is the primary example included with Ralph Search. It demonstrates:
- Detailed intake form for a freelancer-focused product
- B2C pricing considerations (one-time vs. subscription)
- GTM strategy timed around tax season
- Community-based research (Reddit, Indie Hackers)

**Run it:**
```bash
./orchestrator.sh projects/receiptrally
```

---

## Example 2: API Rate Limiter SaaS (hypothetical)

### Intake Summary
```markdown
**App Name**: RateLimitr
**One-Line Description**: Drop-in API rate limiting for any backend
**Avatar**: Backend developers building APIs (Node.js, Python)
**Problem**: Building rate limiting from scratch is tedious, error-prone,
and wastes 2-3 days every time you need it

**Unique Approach**:
- One-line SDK integration
- Works with any framework
- Dashboard for configuration
- No DevOps needed

**Pricing Hypothesis**: $29/mo for startups, $99/mo for growth
**GTM Hypothesis**: Hacker News, dev Twitter, framework-specific communities
```

### Key Research Differences
- **Phase 1**: Look for developer tools market (different from consumer)
- **Phase 2**: Search GitHub issues, Stack Overflow, dev forums
- **Phase 3**: Compare to Kong, nginx, AWS WAF, custom solutions
- **Phase 4**: Subscription model appropriate for infrastructure
- **Phase 5**: Dev communities, framework docs, conference sponsorships

---

## Example 3: Local Business Review App (hypothetical)

### Intake Summary
```markdown
**App Name**: NeighborReviews
**One-Line Description**: Hyperlocal business reviews from verified neighbors
**Avatar**: Suburban homeowners aged 35-55 looking for local services
**Problem**: Can't trust Yelp/Google reviews (fake, outdated, not local)

**Unique Approach**:
- Verified residents only (address verification)
- Focus on home services (plumbers, electricians, etc.)
- Neighborhood-specific recommendations
- No paid placements

**Pricing Hypothesis**: Free for users, businesses pay $99/mo for presence
**GTM Hypothesis**: Nextdoor-style neighborhood expansion, local SEO
```

### Key Research Differences
- **Phase 1**: Local services market is massive but fragmented
- **Phase 2**: Research in Nextdoor, Facebook Groups, local forums
- **Phase 3**: Yelp, Google, Angi, Thumbtack - massive competition
- **Phase 4**: Two-sided marketplace economics (different model)
- **Phase 5**: Geographic expansion strategy, local influencers

---

## Example 4: Chrome Extension for Recruiters (hypothetical)

### Intake Summary
```markdown
**App Name**: LinkedInPlus
**One-Line Description**: Supercharge LinkedIn with AI-powered outreach
**Avatar**: Tech recruiters and sales development reps (SDRs)
**Problem**: Writing personalized LinkedIn messages is slow and tedious

**Unique Approach**:
- AI generates personalized messages based on profile
- One-click send
- Response tracking
- A/B testing built in

**Pricing Hypothesis**: $49/mo for individuals, $149/mo for teams
**GTM Hypothesis**: LinkedIn itself, recruiter communities, HR tech conferences
```

### Key Research Differences
- **Phase 1**: Sales/recruiting tools market is competitive
- **Phase 2**: Research in r/recruiting, r/sales, LinkedIn groups
- **Phase 3**: Outreach.io, Apollo, Lemlist - differentiation crucial
- **Phase 4**: B2B subscription with team pricing
- **Phase 5**: LinkedIn's own ad platform, industry conferences

---

## Example 5: Mobile Game with Premium Features (hypothetical)

### Intake Summary
```markdown
**App Name**: PuzzleQuest
**One-Line Description**: Daily puzzle game with competitive leaderboards
**Avatar**: Casual gamers who play Wordle, crosswords, sudoku daily
**Problem**: Existing puzzle games are either too simple or too complex

**Unique Approach**:
- Unique puzzle mechanic (not just another Wordle clone)
- Daily challenges with global leaderboard
- Social features (challenge friends)
- No ads (premium model)

**Pricing Hypothesis**: Free with $4.99 premium unlock
**GTM Hypothesis**: App Store featuring, word of mouth, game review sites
```

### Key Research Differences
- **Phase 1**: Mobile gaming market is HUGE but brutal
- **Phase 2**: Research in r/puzzles, r/wordgames, gaming forums
- **Phase 3**: Wordle, NYT Games, casual game landscape
- **Phase 4**: Freemium mobile economics (very different)
- **Phase 5**: App Store optimization, viral mechanics, influencers

---

## Adapting Research for Your Use Case

### B2B vs B2C

| Aspect | B2C | B2B |
|--------|-----|-----|
| Phase 2 sources | Reddit, Twitter, forums | LinkedIn, industry forums, Slack |
| Pain evidence | Individual complaints | ROI calculations, lost revenue |
| Phase 4 pricing | Simple tiers | Custom/enterprise, usage-based |
| Phase 5 GTM | Product Hunt, social | Content, events, partnerships |

### Different Market Sizes

**Niche Markets (<$10M)**
- Lower TAM threshold acceptable
- Focus on dominance potential
- Higher pricing may be needed

**Mass Markets (>$100M)**
- Competition is fierce
- Differentiation crucial
- Distribution advantage matters more

### Platform-Specific Considerations

**iOS/Mac Apps**
- Apple's 30% cut affects economics
- App Store review process
- Apple Design Award potential

**Web Apps**
- Lower friction to try
- SEO matters more
- Subscription more common

**Extensions/Plugins**
- Platform dependency risk
- Distribution through store
- Limited monetization options

---

## Template for New Examples

When setting up a new project, consider:

1. **Market Type**
   - B2C, B2B, B2B2C?
   - Platform (web, mobile, desktop)?
   - Geographic scope?

2. **Avatar Specificity**
   - Job title/role?
   - Company size?
   - Industry vertical?

3. **Pain Documentation**
   - Where does avatar complain?
   - What language do they use?
   - How do they currently solve it?

4. **Competitive Landscape**
   - Direct competitors?
   - Indirect solutions?
   - DIY alternatives?

5. **Business Model Fit**
   - One-time, subscription, usage?
   - Freemium possible?
   - Team/enterprise expansion?

6. **GTM Realism**
   - Where is avatar reachable?
   - What channels are affordable?
   - Who has succeeded similarly?

---

## Running Multiple Projects

Compare opportunities side-by-side:

```bash
# Set up multiple projects
mkdir -p projects/{app1,app2,app3}

# Copy intake forms
cp templates/project-intake-form.md projects/app1/intake.md
cp templates/project-intake-form.md projects/app2/intake.md
cp templates/project-intake-form.md projects/app3/intake.md

# Fill out all three (do this thoughtfully!)

# Generate PRDs
for app in app1 app2 app3; do
  claude projects/$app <<EOF
Read intake.md
Generate research-prd.md from ../../templates/research-prd-template.md
EOF
done

# Run research (can run in parallel)
./orchestrator.sh projects/app1 &
./orchestrator.sh projects/app2 &
./orchestrator.sh projects/app3 &

# Wait for completion, then compare
cat projects/*/deliverables/GO-NO-GO-DECISION.md
```

---

*The best way to learn is to try. Start with the ReceiptRally example, then adapt for your own ideas!*
