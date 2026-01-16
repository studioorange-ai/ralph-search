# Market Research Engine Builder

This package contains everything you need to build your own Market Research Engine using Claude Code.

## 📦 What's Included

- `build-mre-prd.md` - The complete PRD that Claude Code will execute to build the system
- `config.json` - Configuration for the build process
- `quickstart.sh` - Automated setup script

## 🚀 Quick Start (Recommended)

**Option 1: Automated (easiest)**
```bash
./quickstart.sh
```

This will:
1. Check if Claude Code is installed
2. Create the output directory (you'll be prompted for location)
3. Execute the PRD to build the complete system
4. Run tests to verify everything works

**Option 2: Manual**
```bash
# 1. Open Claude Code in this directory
claude .

# 2. Give it this prompt:
"Read build-mre-prd.md and execute all 7 phases sequentially.
Create all files in ./output/ directory (or your preferred location).
Validate each phase before proceeding to next.
Generate all templates with complete content (not placeholders).
Test the system with ReceiptRally example at the end.
Report when complete."
```

## ⏱️ Build Time

- **Estimated**: 2-4 hours (fully autonomous)
- **Phases**: 7 sequential phases
- **Output**: Complete market research system in your chosen directory

## ✅ What Gets Built

After the build completes, you'll have:

```
ralph-search/   # (or your chosen output directory)
├── README.md                    # How to use the system
├── orchestrator.sh              # Main execution script
├── templates/                   # Forms and templates
│   ├── project-intake-form.md
│   ├── research-prd-template.md
│   └── validation-report-template.md
├── agents/                      # Validation logic
│   ├── market-validator.md
│   ├── avatar-validator.md
│   ├── pricing-validator.md
│   └── gtm-validator.md
├── projects/
│   └── receiptrally/          # Complete example
└── docs/                        # Usage guides
```

## 🎯 First Use

Once built, try the example:
```bash
cd ralph-search  # or your output directory
./orchestrator.sh projects/receiptrally
```

This will execute full market research on the ReceiptRally example (2-15 hours).

## 📖 Using for Your Own Apps

```bash
cd ralph-search  # or your output directory

# 1. Create new project
cp templates/project-intake-form.md projects/my-app/intake.md

# 2. Fill out intake form (5 minutes)
# Edit projects/my-app/intake.md

# 3. Generate research PRD
claude projects/my-app <<EOF
Read intake.md and generate research-prd.md
EOF

# 4. Execute research
./orchestrator.sh projects/my-app

# 5. Review results
cat projects/my-app/deliverables/GO-NO-GO-DECISION.md
```

## 🔧 Requirements

- **Claude Code CLI** - Install from https://docs.anthropic.com/claude/docs/claude-code
- **Bash shell** - Mac/Linux (Windows users: use WSL)
- **Optional**: API keys for Reddit, Apify (for enhanced web scraping)

## 🤔 Troubleshooting

### "Claude Code not found"
```bash
# Check if installed
which claude

# If not, install from Anthropic docs
```

### "Build failed at Phase X"
- Check the logs for specific error
- The PRD has detailed validation at each phase
- If stuck, open an issue with the error message

### "Takes too long"
- Build process: 2-4 hours (one-time)
- Per-app research: 2-15 hours depending on config
- Both run autonomously - you can close terminal

## 📚 Learn More

After building, see:
- `ralph-search/README.md` - System overview
- `ralph-search/docs/USAGE.md` - Detailed usage guide
- `ralph-search/docs/PHASE-GUIDE.md` - Methodology deep-dive

## 🎉 What This Enables

Once built, you can:
- Research 5 app ideas in parallel
- Get GO/NO-GO decisions in hours, not weeks
- Validate market, avatar, pricing, and GTM automatically
- Make data-driven decisions about what to build

## 💡 Pro Tips

1. **Run multiple validations**: Compare 3-5 ideas side-by-side
2. **Trust the validators**: They're intentionally rigorous
3. **Review checkpoints**: Don't just skip to final decision
4. **Adjust budgets**: Edit `config/research-config.json` per project
5. **Iterate on intake**: Better intake = better research

## 🙏 Credits

Built with:
- **Claude Code** - Autonomous execution
- **Ralph** - Loop-based agent inspiration
- **Alex Hormozi** - $100M Offers framework
- **Russell Brunson** - Value Ladder methodology

---

**Ready? Run `./quickstart.sh` to begin!**
