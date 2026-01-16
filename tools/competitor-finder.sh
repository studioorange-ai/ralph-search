#!/bin/bash

# Competitor Finder Helper
# Usage: ./competitor-finder.sh "product category" [output_file]
#
# This script provides search queries and resources for finding competitors.
# The actual research is done by Claude Code using these suggestions.

set -e

CATEGORY="${1:?Error: Please provide a product category (e.g., 'text rephrasing tool')}"
OUTPUT_FILE="${2:-competitor-research.md}"

# Colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}Competitor Finder Helper${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Category: $CATEGORY"
echo ""

echo -e "${YELLOW}Generating search queries...${NC}"
echo ""

# Generate search queries
cat << EOF

## Recommended Search Queries

### Direct Competitors (same problem)
1. "$CATEGORY software"
2. "$CATEGORY app"
3. "$CATEGORY tool"
4. "best $CATEGORY"
5. "$CATEGORY alternative"

### Product Hunt
- https://www.producthunt.com/search?q=${CATEGORY// /%20}

### G2 Software Reviews
- https://www.g2.com/search?utf8=%E2%9C%93&query=${CATEGORY// /%20}

### Capterra
- https://www.capterra.com/search/?query=${CATEGORY// /%20}

### AlternativeTo
- https://alternativeto.net/browse/search/?q=${CATEGORY// /%20}

### Reddit
- https://www.reddit.com/search/?q=${CATEGORY// /%20}

### Hacker News (via Algolia)
- https://hn.algolia.com/?q=${CATEGORY// /%20}

## Data to Collect Per Competitor

For each competitor found, gather:

### Basic Info
- [ ] Company name
- [ ] Website URL
- [ ] One-line description
- [ ] Founded year (if available)

### Pricing
- [ ] Pricing model (one-time/subscription/freemium)
- [ ] Price points (all tiers)
- [ ] Free trial availability

### Scale Indicators
- [ ] Employee count (LinkedIn)
- [ ] Funding raised (Crunchbase)
- [ ] Traffic estimate (SimilarWeb free tier)
- [ ] App store ratings/reviews count
- [ ] Social media following

### Product
- [ ] Key features (top 5)
- [ ] Platforms (web/desktop/mobile)
- [ ] Integrations
- [ ] Last update date

### Reviews
- [ ] Overall rating (G2, Capterra, App Store)
- [ ] Top positive themes
- [ ] Top negative themes (gold for finding gaps!)

## Output Format

Save findings to: $OUTPUT_FILE

Use this markdown template:

\`\`\`markdown
# Competitor: [Name]

## Overview
- **Website**: [URL]
- **Description**: [One-liner]
- **Founded**: [Year]
- **Category**: [Primary category]

## Pricing
| Tier | Price | Features |
|------|-------|----------|
| Free | \$0 | ... |
| Pro | \$X/mo | ... |

## Scale
- Employees: X
- Funding: \$X
- Est. Traffic: X/month

## Key Features
1. Feature 1
2. Feature 2
3. Feature 3

## Review Summary
- Overall Rating: X/5 (N reviews)
- Top Praise: "..."
- Top Complaint: "..."

## Notes
[Any other observations]
\`\`\`

EOF

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}Use these queries to research competitors.${NC}"
echo -e "${GREEN}Claude Code will execute the actual research.${NC}"
