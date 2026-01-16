# Ralph Search: Usage Guide

This guide walks you through using Ralph Search to validate your product ideas.

---

## Prerequisites

Before starting, ensure you have:

1. **Claude Code CLI** installed and authenticated
   ```bash
   # Check if installed
   which claude

   # If not installed, visit:
   # https://docs.anthropic.com/claude-code
   ```

2. **Bash shell** (Mac or Linux)
   - Windows users: Use WSL or Git Bash

3. **Optional: API keys** for enhanced research
   - Reddit API credentials (free, for PRAW)
   - Apify account ($5-10 for bulk scraping)

---

## Step 1: Set Up Your Project

### Create project folder
```bash
cd ralph-search
mkdir -p projects/my-app-name
```

### Copy the intake template
```bash
cp templates/project-intake-form.md projects/my-app-name/intake.md
```

### Fill out the intake form
Open `projects/my-app-name/intake.md` in your editor and fill out all sections.

**Tips for a good intake:**
- Be specific about your avatar (narrow is better than broad)
- List actual communities where avatar hangs out
- Be honest about your assumptions (that's what we're validating!)
- Set realistic budget constraints

---

## Step 2: Generate Research PRD

The intake form gets transformed into a detailed research plan.

### Option A: Automatic generation
```bash
claude projects/my-app-name <<EOF
Read intake.md.
Read ../../templates/research-prd-template.md.
Generate a customized research-prd.md by:
1. Replacing all {{VARIABLES}} with data from intake.md
2. Keeping all phase structures intact
3. Customizing research tasks for this specific app
4. Save to research-prd.md
EOF
```

### Option B: Manual customization
1. Copy the template: `cp templates/research-prd-template.md projects/my-app-name/research-prd.md`
2. Edit to replace `{{VARIABLES}}` with your specific data
3. Customize research tasks as needed

---

## Step 3: Run the Research

### Execute the orchestrator
```bash
./orchestrator.sh projects/my-app-name
```

### What happens:
1. **Phase 1** executes (Market Landscape Scan)
2. Validator agent checks results
3. If PASS: proceed to Phase 2
4. If FAIL: attempt remediation (up to 2 times)
5. If NEEDS REVIEW: prompt you for decision
6. Repeat for all 6 phases
7. Generate final deliverables

### Typical timeline:
- **Hands-off time**: 2-15 hours (depends on depth)
- **Human intervention**: 0-30 minutes (only if NEEDS REVIEW)

---

## Step 4: Review Checkpoints

As research progresses, review the validation reports:

```bash
# Phase 1 results
cat projects/my-app-name/checkpoints/phase1-validation.md

# Phase 2 results
cat projects/my-app-name/checkpoints/phase2-validation.md

# etc.
```

### What to look for:
- **PASS with high confidence**: Great! Research supports this phase.
- **PASS with medium confidence**: Proceed but note the caveats.
- **NEEDS REVIEW**: Read the specific questions and make a judgment call.
- **FAIL**: Read the remediation suggestions.

---

## Step 5: Interpret Results

### Final deliverables location:
```
projects/my-app-name/deliverables/
├── EXECUTIVE-SUMMARY.md    # 2-page overview
├── GO-NO-GO-DECISION.md    # The verdict
├── NEXT-STEPS.md           # Action items
├── RISK-REGISTER.md        # What could go wrong
└── FULL-RESEARCH-REPORT.md # All findings (40-60 pages)
```

### Reading the GO/NO-GO Decision:

**STRONG GO (Score >= 8.0)**
- High confidence in the opportunity
- Build immediately
- Risks are manageable

**CONDITIONAL GO (Score 6.5-7.9)**
- Opportunity exists but has weaknesses
- Address specific issues before building
- Consider reducing scope/investment

**WEAK GO (Score 5.0-6.4)**
- Risky opportunity
- Consider alternatives
- Only proceed if you can accept potential failure

**NO-GO (Score < 5.0)**
- Research doesn't support this idea
- Read pivot suggestions
- Try a different approach or market

---

## Advanced Usage

### Running multiple projects
```bash
# Start all in background
./orchestrator.sh projects/app1 &
./orchestrator.sh projects/app2 &
./orchestrator.sh projects/app3 &

# Monitor progress
tail -f projects/app1/checkpoints/*.md
```

### Pausing after each phase
Edit `config/research-config.json`:
```json
{
  "pause_after_phase_1": true,
  "pause_after_phase_2": true,
  "pause_after_phase_3": true,
  "pause_after_phase_4": true,
  "pause_after_phase_5": true
}
```

### Adjusting validation strictness
The validator agents in `agents/` can be edited to be more or less strict:
- Lower thresholds for early-stage exploration
- Higher thresholds for late-stage validation

### Using helper tools
```bash
# Search Reddit for pain quotes
./tools/reddit-search.sh "receipt tracking is a mess" "freelance"

# Generate competitor search queries
./tools/competitor-finder.sh "receipt tracker app"

# Check validation status
./tools/validation-checker.sh projects/my-app/checkpoints/phase1-validation.md
```

---

## Troubleshooting

### "Claude Code not found"
```bash
# Check PATH
echo $PATH

# Ensure Claude Code is installed
# Visit: https://docs.anthropic.com/claude-code
```

### "Validation file not found"
The phase didn't complete properly. Check:
- Claude Code output for errors
- Research artifacts in `research/phaseN/`
- Try re-running the phase

### "Research taking too long"
- Check if Claude is actually working (look for file changes)
- Budget may be exhausted (check validation reports)
- Try simpler research scope

### "All phases fail"
Your idea may genuinely not be viable. Review:
- Is the problem real? (Phase 2)
- Is the market big enough? (Phase 1)
- Is there real differentiation? (Phase 3)

Consider pivoting or exploring a different idea.

---

## FAQ

### Q: How accurate is the research?
**A:** The system uses real data from the web, but all market research has limitations. Use results as informed guidance, not absolute truth. Always validate critical assumptions yourself.

### Q: Can I edit the generated research?
**A:** Yes! All outputs are markdown files you can edit. The system won't overwrite your changes unless you re-run that phase.

### Q: What if I disagree with a validation result?
**A:** You can manually update the validation file and continue. The system trusts human judgment when explicitly provided.

### Q: How do I add my own data sources?
**A:** Edit the research-prd.md to include specific sources, or add data files to `research/phaseN/` that Claude will read during execution.

### Q: Can I use this for B2B products?
**A:** Absolutely! Adjust the intake form for B2B context (company size, buyer persona, sales cycle considerations).

---

## Next Steps

1. Start with the ReceiptRally example: `./orchestrator.sh projects/receiptrally`
2. Review the generated outputs to understand the format
3. Create your first project with a real idea
4. Iterate based on results

Good luck with your market validation!
