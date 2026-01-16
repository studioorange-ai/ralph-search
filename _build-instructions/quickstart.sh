#!/bin/bash

# Quick Start: Build the Market Research Engine
# This script helps you get started quickly

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Market Research Engine - Quick Start"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code CLI not found"
    echo ""
    echo "Please install Claude Code first:"
    echo "  https://docs.anthropic.com/claude/docs/claude-code"
    echo ""
    exit 1
fi

echo "✅ Claude Code CLI found"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "📁 Working directory: $SCRIPT_DIR"
echo ""

# Check if build-mre-prd.md exists
if [ ! -f "build-mre-prd.md" ]; then
    echo "❌ build-mre-prd.md not found in current directory"
    exit 1
fi

echo "✅ Found build-mre-prd.md"
echo ""

# Prompt for output directory
DEFAULT_OUTPUT_DIR="./ralph-search"
echo "Where would you like to create the Ralph Search system?"
echo "(Default: $DEFAULT_OUTPUT_DIR)"
read -p "Output directory: " USER_OUTPUT_DIR
OUTPUT_DIR="${USER_OUTPUT_DIR:-$DEFAULT_OUTPUT_DIR}"

# Expand ~ if used
OUTPUT_DIR="${OUTPUT_DIR/#\~/$HOME}"

if [ -d "$OUTPUT_DIR" ]; then
    echo "⚠️  Output directory already exists: $OUTPUT_DIR"
    echo ""
    read -p "Overwrite? [y/N]: " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 1
    fi
    rm -rf "$OUTPUT_DIR"
fi

echo "📦 Creating output directory: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
echo ""

echo "🚀 Starting Claude Code to build Ralph Search..."
echo ""
echo "This will take approximately 2-4 hours to complete all 7 phases."
echo ""
echo "You can monitor progress or close this terminal - Claude Code will continue running."
echo ""
read -p "Press ENTER to start..."
echo ""

# Execute Claude Code with the PRD
claude "$SCRIPT_DIR" <<'EOF'
Read build-mre-prd.md carefully.

This PRD describes how to build a complete Market Research Engine system.

Execute all 7 phases sequentially:
1. Create folder structure in $OUTPUT_DIR/
2. Create all templates with FULL content (not placeholders)
3. Create all validator agents with rigorous criteria
4. Create orchestrator.sh script (make it executable)
5. Create QuickRephrase example project
6. Create all documentation
7. Test the system end-to-end

Important instructions:
- Work in $OUTPUT_DIR/ directory (create it if needed)
- Generate COMPLETE files, not stubs or placeholders
- Make scripts executable: chmod +x orchestrator.sh
- Test thoroughly in Phase 7
- Fix any bugs found during testing

Do not skip any tasks.
Report progress after each phase.
Report when complete.

Start building now!
EOF

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Build Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Ralph Search is ready at:"
echo "  $OUTPUT_DIR"
echo ""
echo "Next steps:"
echo "  1. cd $OUTPUT_DIR"
echo "  2. Read README.md for usage instructions"
echo "  3. Try the example: ./orchestrator.sh projects/quickrephrase"
echo ""
echo "To research your own app:"
echo "  1. cp templates/project-intake-form.md projects/my-app/intake.md"
echo "  2. Fill out the intake form (5 minutes)"
echo "  3. ./orchestrator.sh projects/my-app"
echo ""
