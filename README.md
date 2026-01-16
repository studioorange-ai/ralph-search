# Ralph Search

> Stop guessing. Start validating. Get a GO/NO-GO decision on your product idea in hours, not months.

**Ralph Search** is an autonomous market validation system powered by Claude Code. Tell it your app idea, walk away, and come back to a comprehensive research report with a data-driven recommendation.

---

## The Problem

You have an app idea. You *think* people will pay for it. But:
- Will they actually pay, or just say "cool idea"?
- Is the market big enough to matter?
- Can you actually reach these customers?
- What do competitors charge, and why?

Most founders skip this research and waste months building something nobody wants.

## The Solution

Ralph Search does the boring-but-critical market research for you:

| Phase | What It Does | Output |
|-------|--------------|--------|
| **Market Scan** | Finds 20+ competitors, calculates TAM, analyzes trends | Market landscape report |
| **Pain Mining** | Scrapes 500+ posts, extracts verbatim pain quotes | Avatar validation |
| **Differentiation** | Builds feature matrix, finds gaps, defines positioning | Competitive analysis |
| **Pricing** | Models unit economics, validates LTV:CAC | Pricing strategy |
| **GTM Strategy** | Maps channels, estimates CAC, plans launch | Go-to-market plan |
| **Synthesis** | Scores everything, makes the call | **GO / NO-GO decision** |

Each phase must pass validation before proceeding. If your idea has fatal flaws, research stops early and tells you why.

---

## Quick Start

### 1. Clone and start Claude Code
```bash
git clone https://github.com/yourusername/ralph-search.git
cd ralph-search
claude .
```

### 2. Say: "I have a new idea to research"

Claude interviews you about your idea (5-10 min), then generates all project files automatically.

### 3. Execute in Terminal
```bash
./orchestrator.sh projects/your-project-name
```

### 4. Come back later and read your verdict
```bash
cat projects/your-project-name/deliverables/GO-NO-GO-DECISION.md
```

**Or try the included example:**
```bash
./orchestrator.sh projects/receiptrally
```

---

## What You Get

After autonomous execution:

```
projects/your-idea/deliverables/
├── GO-NO-GO-DECISION.md      # The verdict (start here)
├── EXECUTIVE-SUMMARY.md      # 2-page overview
├── FULL-RESEARCH-REPORT.md   # Complete findings (40-60 pages)
├── RISK-REGISTER.md          # What could go wrong
└── NEXT-STEPS.md             # What to do next
```

**Scoring:**
- **8.0+** = Strong GO - build it
- **6.5-7.9** = Conditional GO - address weaknesses first
- **5.0-6.4** = Weak GO - risky, consider alternatives
- **<5.0** = NO-GO - don't build this, read pivot suggestions

---

## How It Works

```
ralph-search/
├── orchestrator.sh       # Main execution loop
├── agents/               # Validator agents (intentionally skeptical)
├── templates/            # Intake form, PRD template, reports
├── tools/                # Helper scripts for research
└── projects/             # Your research projects
    └── [app-name]/
        ├── intake.md           # Your brief
        ├── research-prd.md     # Generated research plan
        ├── checkpoints/        # Phase validation reports
        ├── research/           # Raw data collected
        └── deliverables/       # Final reports
```

The system uses a **phase-gated loop**: each phase executes, then a validator agent checks if criteria are met. Failed phases get 2 remediation attempts before stopping. This prevents wasting time on ideas with fundamental problems.

---

## Configuration

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

## Requirements

- **Claude Code CLI** - [Install here](https://claude.ai/code)
- **Bash shell** (Mac/Linux, or WSL on Windows)
- **Optional**: Reddit API, Apify for enhanced scraping

---

## Run Multiple Ideas in Parallel

```bash
./orchestrator.sh projects/idea1 &
./orchestrator.sh projects/idea2 &
./orchestrator.sh projects/idea3 &

# Later: compare results
cat projects/idea1/deliverables/GO-NO-GO-DECISION.md
cat projects/idea2/deliverables/GO-NO-GO-DECISION.md
cat projects/idea3/deliverables/GO-NO-GO-DECISION.md
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Phase fails validation | Check `checkpoints/phaseN-validation.md` for details |
| Not enough data | Add Reddit/Apify API keys, try different search terms |
| Script errors | Run `which claude` to verify CLI is installed |
| Borderline validation | System pauses for human review - you decide |

---

## Best Practices

1. **Be specific** - "Mac developers who write docs daily" not "people who write"
2. **List real communities** - Verify r/MacApps exists before listing it
3. **Trust the validators** - They're intentionally skeptical. A "NO-GO" saves you months.
4. **Review checkpoints** - Don't skip to the final decision
5. **Run multiple ideas** - Compare opportunities side-by-side

---

## Learn More

- [`docs/GETTING-STARTED.md`](docs/GETTING-STARTED.md) - Complete walkthrough
- [`docs/USAGE.md`](docs/USAGE.md) - Detailed usage guide
- [`docs/PHASE-GUIDE.md`](docs/PHASE-GUIDE.md) - Research methodology
- [`projects/receiptrally/`](projects/receiptrally/) - Worked example

---

## Credits

Inspired by:
- [Ralph](https://github.com/anthropics/ralph) - Autonomous agent loops
- Alex Hormozi - $100M Offers framework
- Russell Brunson - Value Ladder methodology

---

## License

MIT - fork and customize as needed.

---

**Built for indie hackers who'd rather validate than guess.**

