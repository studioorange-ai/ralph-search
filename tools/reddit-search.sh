#!/bin/bash

# Reddit Search Helper
# Usage: ./reddit-search.sh "search query" "subreddit" [limit]
#
# This script provides a simple interface for searching Reddit.
# For more comprehensive scraping, consider using:
# - PRAW (Python Reddit API Wrapper) - free but rate limited
# - Apify Reddit Scraper - $5-10 for bulk scraping
# - Pushshift API - historical data access

set -e

QUERY="${1:?Error: Please provide a search query}"
SUBREDDIT="${2:-all}"
LIMIT="${3:-25}"

# Colors
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}Reddit Search Helper${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Query: $QUERY"
echo "Subreddit: r/$SUBREDDIT"
echo "Limit: $LIMIT"
echo ""

# Method 1: Reddit's JSON API (no auth required, but rate limited)
# Note: Reddit's public JSON API is very limited. For real research, use PRAW or Apify.

SEARCH_URL="https://www.reddit.com/r/${SUBREDDIT}/search.json?q=${QUERY// /%20}&limit=${LIMIT}&sort=relevance&t=year"

echo -e "${YELLOW}Search URL:${NC}"
echo "$SEARCH_URL"
echo ""

echo -e "${YELLOW}Fetching results...${NC}"
echo ""

# Try to fetch (may fail due to rate limiting or Reddit blocking)
if command -v curl &> /dev/null; then
    response=$(curl -s -A "MRE-Research-Tool/1.0" "$SEARCH_URL" 2>/dev/null || echo '{"error": "fetch failed"}')

    if echo "$response" | grep -q '"error"'; then
        echo "Note: Reddit's public API is rate-limited."
        echo ""
        echo "For comprehensive research, use one of these methods:"
        echo ""
        echo "1. PRAW (Python Reddit API Wrapper):"
        echo "   pip install praw"
        echo "   # Requires Reddit API credentials (free)"
        echo ""
        echo "2. Apify Reddit Scraper (\$5-10):"
        echo "   https://apify.com/trudax/reddit-scraper"
        echo ""
        echo "3. Manual search:"
        echo "   https://www.reddit.com/r/${SUBREDDIT}/search?q=${QUERY// /%20}"
        echo ""
    else
        # Parse and display results (simplified)
        echo "Results preview (first 5 posts):"
        echo "$response" | grep -o '"title": "[^"]*"' | head -5 | sed 's/"title": //g'
        echo ""
        echo "For full data, save the JSON response and parse with jq or Python."
    fi
else
    echo "curl not found. Please install curl or use one of these alternatives:"
    echo ""
    echo "1. PRAW (Python Reddit API Wrapper)"
    echo "2. Apify Reddit Scraper"
    echo "3. Manual browsing at reddit.com"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${CYAN}Search complete${NC}"
