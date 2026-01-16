# CLAUDE.md - Ralph Search

This file guides Claude Code when working in the Ralph Search project.

## What This Project Is

**Ralph Search** is an autonomous market validation system that validates product ideas through 6 research phases, producing a data-driven GO/NO-GO recommendation.

**Your role**: Help users create and configure research projects. The actual research execution happens via `./orchestrator.sh` in Terminal.

---

## Primary Workflow: New Idea Interview

When a user says they have a **new idea to research** (or similar), follow this workflow:

### Step 1: Get the Project Name
Ask: "What should we call this project? Give me a short name (no spaces, use dashes). For example: `quick-rephrase`, `habit-tracker`, `invoice-tool`"

### Step 2: Create the Project Folder
```bash
mkdir -p projects/[project-name]/{checkpoints,research/{phase1,phase2,phase3,phase4,phase5},deliverables}
```

### Step 3: Interview the User
Ask these questions ONE AT A TIME. Wait for each answer before asking the next. Be conversational, not robotic.

**Basic Info:**
1. "What's the name of your app/product?"
2. "Describe what it does in one sentence."

**The Problem:**
3. "What problem does this solve? Describe it in your own words - what frustrates people? What do they currently have to do that's painful?"
4. "How often does this problem occur for your target user? Daily? Weekly? Monthly?"

**Target Avatar:**
5. "Who specifically is this for? Be narrow - 'Mac developers who write docs daily' is better than 'people who write'"
6. "Where do these people hang out online? List specific communities - subreddits, Twitter hashtags, forums, Slack groups"
7. "What tools or workarounds do they currently use to solve this problem?"

**Your Solution:**
8. "What's your unique approach? What makes your solution different from what exists?"
9. "Why does this difference matter? What's the benefit?"

**Assumptions to Validate:**
10. "What do you think the market size is? (rough estimate is fine)"
11. "What would you charge? One-time purchase or subscription?"
12. "How long would it take to build an MVP?"
13. "How would you reach your first 100 customers?"

**Research Priorities:**
14. "What are you most uncertain about? What do you MOST want this research to answer? (Give me 2-4 questions)"

**Constraints:**
15. "How much time should we spend on research? (15 hours is typical)"
16. "Budget for research tools? ($50 is typical)"
17. "When do you need to make the GO/NO-GO decision?"
18. "What's your risk tolerance? Low (only build if slam dunk), Medium (willing to take reasonable risk), or High (will build even if uncertain)?"

### Step 4: Generate intake.md
After collecting all answers, generate `projects/[project-name]/intake.md` using this format:

```markdown
# Market Research Intake: [App Name]

## Basic Info
**App Name**: [answer]
**One-Line Description**: [answer]
**Your Role**: Founder
**Date**: [today's date]

## The Problem (in your words)
[answer - expand on their description, include the pain points and frequency]

## Target Avatar (your hypothesis)
**Who**: [answer]
**Where they are**: [list of communities they mentioned]
**What they currently use**: [answer]
**Why they'd care**: [synthesize from their answers - what benefit do they get]

## Your Unique Approach
**What makes you different**: [answer]
**Why this matters**: [answer]

## Initial Assumptions (we'll validate these)
- **Market size**: [answer]
- **Willingness to pay**: [answer]
- **Competitive advantage**: [synthesize from unique approach]
- **Time to build MVP**: [answer]
- **Path to first 100 customers**: [answer]

## Research Priorities (what you most want to know)
1. [priority 1]
2. [priority 2]
3. [priority 3]
4. [priority 4 if given]

## Constraints
**Time budget**: [answer] hours max for research
**Money budget**: $[answer] max
**Launch timeline**: [answer]
**Risk tolerance**: [answer]

## What success looks like
After research, I want to know:
- [ ] Clear answer: should I build this? (GO/NO-GO)
- [ ] If GO: what's the positioning, pricing, and launch strategy?
- [ ] If NO-GO: why not and what should I do instead?

---

## Notes for Research System
[Add any relevant notes from the conversation - special constraints, context, etc.]
```

### Step 5: Generate research-prd.md
Read `templates/research-prd-template.md` and generate a customized `projects/[project-name]/research-prd.md` by:
1. Replacing all `{{VARIABLES}}` with data from the intake
2. Keeping all phase structures intact
3. Customizing the research tasks for this specific product/market

### Step 6: Confirm Ready to Run
Tell the user:
```
Your research project is ready!

Created:
- projects/[project-name]/intake.md
- projects/[project-name]/research-prd.md

To run the research, open Terminal and run:
  cd ralph-search
  ./orchestrator.sh projects/[project-name]

This will take 2-15 hours to complete. You can check progress in:
- projects/[project-name]/checkpoints/ (validation reports)
- projects/[project-name]/research/ (raw data)

When done, your GO/NO-GO decision will be in:
  projects/[project-name]/deliverables/GO-NO-GO-DECISION.md
```

---

## Other Commands

### "Show me my projects"
List all projects:
```bash
ls -la projects/
```

### "Check status of [project]"
Show validation status:
```bash
ls projects/[project]/checkpoints/
cat projects/[project]/checkpoints/*.md | head -50
```

### "Show the decision for [project]"
```bash
cat projects/[project]/deliverables/GO-NO-GO-DECISION.md
```

### "Edit the intake for [project]"
Open and help them modify `projects/[project]/intake.md`, then regenerate research-prd.md.

### "Run the QuickRephrase example"
Tell them:
```
To run the included example, open Terminal and run:
  cd ralph-search
  ./orchestrator.sh projects/quickrephrase
```

---

## Important Notes

1. **Don't run the orchestrator from Claude Code** - It needs to run in Terminal for proper interactive prompts and long execution time.

2. **Interview conversationally** - Don't dump all questions at once. Ask one, wait for answer, acknowledge it, then ask the next.

3. **Be helpful with examples** - If they seem stuck on a question, give examples from the QuickRephrase project.

4. **Validate their answers** - If something seems too broad ("everyone is my target"), push back gently and ask them to narrow it.

5. **The intake quality matters** - Spend time getting good answers. Better intake = better research.

---

## File Structure

```
ralph-search/
├── CLAUDE.md              # This file
├── orchestrator.sh        # Run in Terminal, not here
├── templates/             # Templates for intake and PRD
├── agents/                # Validator agents (don't modify)
├── tools/                 # Helper scripts
├── docs/                  # Documentation
├── config/                # Settings
└── projects/              # Research projects
    ├── quickrephrase/     # Example project
    └── [your-projects]/   # User projects go here
```

---

## Quick Reference

| User Says | Your Action |
|-----------|-------------|
| "New idea" / "Research something" | Start the interview workflow |
| "List projects" | `ls projects/` |
| "Status of X" | Check checkpoints folder |
| "Show decision" | Read GO-NO-GO-DECISION.md |
| "Help" / "How does this work" | Explain the workflow |
| "Run research" | Tell them to use Terminal |
