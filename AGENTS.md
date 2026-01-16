# Repository Guidelines

## Project Structure & Module Organization

- `orchestrator.sh` is the main entry point that runs the phase-gated research loop.
- `agents/` contains validator prompts (market, avatar, pricing, GTM) used during each phase.
- `templates/` holds the intake form, PRD template, and validation report template.
- `tools/` provides helper scripts such as `validation-checker.sh` and `reddit-search.sh`.
- `projects/` stores per-idea workspaces (`intake.md`, `research-prd.md`, `checkpoints/`, `research/`, `deliverables/`).
- `config/` contains `research-config.json` plus the example config.
- `docs/` documents usage, phases, and examples.

## Build, Test, and Development Commands

- `claude .` starts Claude Code in the repo (required to generate project files).
- `./orchestrator.sh projects/<project-name>` runs the full research pipeline.
- `./orchestrator.sh projects/receiptrally` runs the included demo project.
- `cp templates/project-intake-form.md projects/<project-name>/intake.md` seeds a new intake.
- `tools/validation-checker.sh projects/<project-name>/checkpoints/phase1-validation.md` summarizes a validation report.

## Coding Style & Naming Conventions

- Bash scripts use `#!/bin/bash`, `set -e`, and 4-space indentation; keep helpers in `log_*` functions.
- Prefer explicit, descriptive file names (e.g., `phase2-validation.md`, `GO-NO-GO-DECISION.md`).
- Markdown templates should stay structured and high-signal; avoid casual prose in templates and agents.

## Testing Guidelines

- There is no automated test suite in this repository.
- Validate script changes by running the demo project or a small test project and inspecting `checkpoints/` and `deliverables/` outputs.
- Use `tools/validation-checker.sh` for quick PASS/FAIL status checks.

## Commit & Pull Request Guidelines

- Git history is minimal (single initial commit), so no formal convention is established.
- Use short, imperative commit summaries (e.g., "Add validation checker output parsing").
- PRs should describe behavior changes, include key commands run, and link to any updated deliverables or docs.

## Configuration & Secrets

- Adjust `config/research-config.json` for budgets, thresholds, and phase behavior.
- Keep real API keys out of the repo; use `config/research-config.example.json` as the safe reference.
- Optional services like Reddit or Apify improve data collection but are not required.

## Agent-Specific Notes

- Validator prompts in `agents/` are intentionally skeptical; edits here change pass/fail behavior.
- The orchestrator expects standard file locations and naming, so keep the project tree consistent.
