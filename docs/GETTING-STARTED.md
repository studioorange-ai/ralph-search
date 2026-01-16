# Ralph Search: Complete Getting Started Guide

---

## TL;DR - Quick Start

### Option A: Interactive Interview (Recommended)

**Step 1:** Open Claude Code in the project directory:
```bash
cd ralph-search
claude .
```

**Step 2:** Say: **"I have a new idea to research"**

Claude will interview you about your idea (takes 5-10 minutes), then automatically create all the project files.

**Step 3:** When the interview is done, open **Terminal** and run:
```bash
cd ralph-search
./orchestrator.sh projects/your-project-name
```

**Step 4:** Wait 2-15 hours, then read your results:
```bash
cat projects/your-project-name/deliverables/GO-NO-GO-DECISION.md
```

---

### Option B: Run the Included Example

```bash
# Open Terminal
cd ralph-search
./orchestrator.sh projects/quickrephrase

# Wait 2-15 hours, then check the result
cat projects/quickrephrase/deliverables/GO-NO-GO-DECISION.md
```

---

**That's it!** The detailed explanations below cover what each step does and how to interpret results.

---

## What Is This?

**Ralph Search** is an autonomous market validation system that validates whether your product idea is worth building. Instead of spending months building something nobody wants, it spends 2-15 hours researching your idea and delivers a data-driven GO/NO-GO recommendation.

Think of it as having a rigorous market researcher working for you around the clock, who:
- Finds and analyzes your competitors
- Discovers if real people actually have the problem you're solving
- Determines if you can differentiate from existing solutions
- Validates that the business economics work
- Identifies how you'll reach your first customers
- Gives you a clear recommendation with evidence

---

## Why Does This Exist?

**The Problem**: Most product ideas fail not because the product is bad, but because:
- The problem isn't real (founders imagine pain that others don't have)
- The market is too small (not enough people willing to pay)
- There's no differentiation (you're just another option)
- The economics don't work (costs more to acquire customers than they pay)
- You can't reach customers (great product, no distribution)

**The Solution**: Ralph Search validates all of these BEFORE you build, using real data from the internet, not just your assumptions.

---

## How Does It Work?

Ralph Search runs through **6 research phases**, each with validation checkpoints:

```
Phase 1: Market Landscape Scan
    ↓ (must pass validation)
Phase 2: Avatar Pain Mining
    ↓ (must pass validation)
Phase 3: Competitive Differentiation
    ↓ (must pass validation)
Phase 4: Pricing & Economics
    ↓ (must pass validation)
Phase 5: Go-To-Market Strategy
    ↓ (must pass validation)
Phase 6: Final Synthesis → GO/NO-GO Decision
```

Each phase:
1. Executes specific research tasks (finding competitors, scraping forums, analyzing pricing)
2. Saves findings to files
3. Runs through a "validator agent" that checks if criteria are met
4. Produces a PASS, FAIL, or NEEDS REVIEW result

If a phase fails, the system tries to fix it (up to 2 times). If it still fails, research stops - your idea may not be viable.

---

## What You Need

### Required
- **Mac or Linux computer** (Windows users: use WSL)
- **Claude Code CLI** installed and authenticated
  ```bash
  # Check if you have it
  which claude

  # If not, install from: https://docs.anthropic.com/claude-code
  ```

### Optional (for better research)
- Reddit API credentials (free) - for deeper forum scraping
- Apify account ($5-10) - for bulk data collection

---

## Step-by-Step Instructions

### Step 1: Start Claude Code

Open Terminal and run:
```bash
cd ralph-search
claude .
```

This opens Claude Code in the Ralph Search directory.

### Step 2: Tell Claude You Have an Idea

Say something like:
- "I have a new idea to research"
- "I want to validate a product idea"
- "Help me research a new app concept"

### Step 3: Answer the Interview Questions

Claude will ask you questions about your idea, ONE AT A TIME:

1. **Project name** - A short name for the folder (e.g., `habit-tracker`)
2. **App name** - What you'll call the product
3. **One-line description** - What it does in one sentence
4. **The problem** - What pain point you're solving
5. **How often** - Daily? Weekly? Monthly?
6. **Target avatar** - Who specifically is this for?
7. **Where they hang out** - Specific communities (subreddits, forums)
8. **Current solutions** - What do they use today?
9. **Your unique approach** - What makes you different?
10. **Why it matters** - What's the benefit of your approach?
11. **Market size guess** - Your estimate
12. **Pricing idea** - What would you charge?
13. **MVP timeline** - How long to build?
14. **GTM idea** - How would you reach customers?
15. **Research priorities** - What are you most uncertain about?
16. **Time/money budget** - For the research
17. **Decision timeline** - When do you need to know?
18. **Risk tolerance** - Low/Medium/High

**Tips for good answers:**
- Be specific ("Mac developers who write docs daily" not "people who write")
- List real communities you've verified exist
- Be honest about what you don't know - that's what we're researching!

### Step 4: Review the Generated Files

After the interview, Claude creates:
- `projects/your-project/intake.md` - Summary of your answers
- `projects/your-project/research-prd.md` - Detailed research plan

You can review these and ask Claude to modify anything.

### Step 5: Run the Research

```bash
./orchestrator.sh projects/my-app-name
```

**What happens now:**
- The system starts executing Phase 1
- You'll see colorful output showing progress
- Each phase takes 30 minutes to 2 hours
- Total time: 2-15 hours depending on depth

**You can walk away.** The system runs autonomously. Come back later to check results.

**If it asks for input:** Sometimes validation is borderline and needs human judgment. You'll see:
```
Phase X requires human review
Options:
  1) Accept as PASS (continue)
  2) Mark as FAIL (try to fix)
  3) Stop research (exit)
Your decision [1/2/3]:
```

Read the validation report it mentions, then decide.

### Step 7: Review Your Results

When complete, you'll see:
```
Market Research Complete!

Final Deliverables:
  📄 Executive Summary: projects/my-app-name/deliverables/EXECUTIVE-SUMMARY.md
  🎯 GO/NO-GO Decision: projects/my-app-name/deliverables/GO-NO-GO-DECISION.md
  📋 Next Steps: projects/my-app-name/deliverables/NEXT-STEPS.md
  ⚠️  Risk Register: projects/my-app-name/deliverables/RISK-REGISTER.md
  📚 Full Report: projects/my-app-name/deliverables/FULL-RESEARCH-REPORT.md
```

**Start with GO-NO-GO-DECISION.md** - this is the verdict.

---

## Understanding the Results

### The GO/NO-GO Decision

Your final score is weighted across all phases:

| Score | Meaning | What to Do |
|-------|---------|------------|
| **8.0+** | STRONG GO | Build it! High confidence this can work. |
| **6.5-7.9** | CONDITIONAL GO | Promising, but address the weaknesses first. |
| **5.0-6.4** | WEAK GO | Risky. Consider alternatives or reducing scope. |
| **<5.0** | NO-GO | Don't build this. Read pivot suggestions. |

### The Deliverables Explained

**EXECUTIVE-SUMMARY.md** (2 pages)
- Quick overview of all findings
- Read this first for the highlights

**GO-NO-GO-DECISION.md** (the verdict)
- Final recommendation with reasoning
- Score breakdown by phase
- Key risks and mitigations

**NEXT-STEPS.md**
- If GO: What to build first, how to launch
- If NO-GO: Pivot suggestions, alternative ideas

**RISK-REGISTER.md**
- Everything that could go wrong
- Mitigation strategies for each risk

**FULL-RESEARCH-REPORT.md** (40-60 pages)
- Complete findings from all phases
- All the data, quotes, calculations
- Reference this for details

### The Checkpoint Reports

During research, validation reports are saved to `projects/my-app-name/checkpoints/`:
- `phase1-validation.md` - Market landscape results
- `phase2-validation.md` - Avatar pain mining results
- `phase3-validation.md` - Differentiation analysis
- `phase4-validation.md` - Pricing & economics
- `phase5-validation.md` - GTM strategy

Review these to understand WHY each phase passed or failed.

---

## Troubleshooting

### "Command not found: claude"
Claude Code CLI isn't installed or not in your PATH.
```bash
# Check if installed
which claude

# If nothing appears, install Claude Code from:
# https://docs.anthropic.com/claude-code
```

### "Project directory not found"
You need to create the project folder first:
```bash
mkdir -p projects/my-app-name
```

### "Research PRD not found"
You need to generate the research-prd.md file. See Step 5.

### Research is stuck / taking too long
- Check if Claude is still running (look for file changes)
- The system may have hit a rate limit - wait and retry
- Try a simpler research scope in your intake

### Phase keeps failing
Your idea may genuinely have problems in that area. Read the validation report:
```bash
cat projects/my-app-name/checkpoints/phaseX-validation.md
```

Look at:
- What criteria failed?
- What remediation was attempted?
- What does it suggest?

Sometimes the answer is: this idea isn't viable. That's valuable information!

### "NEEDS REVIEW" keeps appearing
This means the validation is borderline. You need to make judgment calls:
1. Read the specific questions in the validation report
2. Decide if you're comfortable proceeding
3. Enter 1 (continue), 2 (retry), or 3 (stop)

---

## Tips for Best Results

### 1. Be Specific in Your Intake
"Mac developers who write documentation daily" is better than "people who write"

### 2. Be Honest About Assumptions
Don't inflate numbers. The system will validate (or invalidate) them anyway.

### 3. List Real Communities
Don't guess - actually check that r/MacApps exists and has active discussion about your problem.

### 4. Set Realistic Budgets
15 hours and $50 is usually enough. Don't set 2 hours and expect comprehensive results.

### 5. Trust the Validators
They're intentionally skeptical. A "NO-GO" saves you months of wasted effort.

### 6. Read the Full Reports
Don't just look at the score. The insights in the research files are valuable even if you don't build this specific idea.

### 7. Run Multiple Ideas
Compare 2-3 ideas side by side:
```bash
./orchestrator.sh projects/idea1 &
./orchestrator.sh projects/idea2 &
./orchestrator.sh projects/idea3 &
```

---

## Example: Running the Included Demo

The system comes with a complete example called "QuickRephrase" (an AI text transformation tool).

### Try it:
```bash
cd ralph-search
./orchestrator.sh projects/quickrephrase
```

### What you'll see:
1. Phase 1 executes (Market Landscape Scan)
2. Validation runs
3. If PASS, Phase 2 starts
4. ... continues through all phases ...
5. Final deliverables generated

### Review the example intake:
```bash
cat projects/quickrephrase/intake.md
```

This shows you how a well-filled-out intake form looks.

---

## File Structure Reference

```
ralph-search/
├── orchestrator.sh           # Main script you run
├── README.md                 # Overview documentation
├── config/
│   └── research-config.json  # Settings (budgets, thresholds)
├── templates/
│   ├── project-intake-form.md      # Copy this to start
│   ├── research-prd-template.md    # Auto-generates PRD
│   └── validation-report-template.md
├── agents/
│   ├── market-validator.md   # Validates Phase 1 & 3
│   ├── avatar-validator.md   # Validates Phase 2 & 3
│   ├── pricing-validator.md  # Validates Phase 4
│   └── gtm-validator.md      # Validates Phase 5
├── tools/
│   ├── reddit-search.sh      # Helper for Reddit research
│   ├── competitor-finder.sh  # Helper for finding competitors
│   └── validation-checker.sh # Quick validation status check
├── docs/
│   ├── GETTING-STARTED.md    # This file
│   ├── USAGE.md              # Detailed usage guide
│   ├── PHASE-GUIDE.md        # Deep dive on each phase
│   └── EXAMPLES.md           # More example projects
└── projects/
    └── quickrephrase/        # Example project
        ├── intake.md         # Filled-out intake form
        ├── research-prd.md   # Generated research plan
        ├── checkpoints/      # Validation reports go here
        ├── research/         # Raw research data goes here
        │   ├── phase1/
        │   ├── phase2/
        │   ├── phase3/
        │   ├── phase4/
        │   └── phase5/
        └── deliverables/     # Final reports go here
```

---

## Quick Reference Commands

```bash
# Navigate to MRE
cd ralph-search

# Create new project
mkdir -p projects/my-idea

# Copy intake template
cp templates/project-intake-form.md projects/my-idea/intake.md

# Edit intake (use any editor)
nano projects/my-idea/intake.md

# Generate research PRD
claude projects/my-idea <<EOF
Read intake.md
Generate research-prd.md from ../../templates/research-prd-template.md
EOF

# Run research
./orchestrator.sh projects/my-idea

# Check final decision
cat projects/my-idea/deliverables/GO-NO-GO-DECISION.md

# Check specific phase validation
cat projects/my-idea/checkpoints/phase2-validation.md
```

---

## Need Help?

1. **Read the docs**: `docs/USAGE.md` and `docs/PHASE-GUIDE.md` have more detail
2. **Check the example**: `projects/quickrephrase/` shows a complete setup
3. **Review validation reports**: They explain exactly why things passed or failed

---

*The goal of Ralph Search is to help you make better decisions faster. A quick "no" on a bad idea is just as valuable as a confident "yes" on a good one. Good luck with your research!*
