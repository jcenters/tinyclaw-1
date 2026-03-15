#!/usr/bin/env bash
# web-search.sh — Search the web via Brave Search API
# Usage: web-search.sh "query" [--count N] [--freshness pd|pw|pm]

set -euo pipefail

QUERY=""
COUNT=10
FRESHNESS=""

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        --count) COUNT="$2"; shift 2 ;;
        --freshness) FRESHNESS="$2"; shift 2 ;;
        --help) grep '^#' "$0" | sed 's/^# \?//'; exit 0 ;;
        -*) echo "Unknown option: $1" >&2; exit 1 ;;
        *) QUERY="$1"; shift ;;
    esac
done

if [[ -z "$QUERY" ]]; then
    echo "Usage: web-search.sh \"query\" [--count N] [--freshness pd|pw|pm]" >&2
    exit 1
fi

# Get API key from 1Password (stored in notesPlain of "OpenClaw ENV" item)
BRAVE_API_KEY=$(op item get bmxvi2ue2pkt2dlvomsrzsdasu --vault Max --format json 2>/dev/null \
    | python3 -c "import json,sys,re; d=json.load(sys.stdin); notes=next((f.get('value','') for f in d.get('fields',[]) if f.get('label')=='notesPlain'),''); m=re.search(r'BRAVE_API_KEY=(\S+)', notes); print(m.group(1) if m else '')")
if [[ -z "$BRAVE_API_KEY" ]]; then
    echo "Error: Could not read BRAVE_API_KEY from 1Password." >&2
    exit 1
fi

# Build URL
ENCODED_QUERY=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))" "$QUERY")
URL="https://api.search.brave.com/res/v1/web/search?q=${ENCODED_QUERY}&count=${COUNT}&text_decorations=false&safesearch=off"
if [[ -n "$FRESHNESS" ]]; then
    URL="${URL}&freshness=${FRESHNESS}"
fi

# Call API
RESPONSE=$(curl -s -f \
    -H "Accept: application/json" \
    -H "Accept-Encoding: gzip" \
    -H "X-Subscription-Token: ${BRAVE_API_KEY}" \
    --compressed \
    "$URL")

if [[ $? -ne 0 ]]; then
    echo "Error: Brave Search API request failed." >&2
    exit 1
fi

# Parse and format results
python3 - "$RESPONSE" <<'EOF'
import json, sys

data = json.loads(sys.argv[1])
results = data.get("web", {}).get("results", [])

if not results:
    print("No results found.")
    sys.exit(0)

for i, r in enumerate(results, 1):
    title = r.get("title", "No title")
    url = r.get("url", "")
    desc = r.get("description", "").strip()
    print(f"{i}. {title}")
    print(f"   URL: {url}")
    if desc:
        print(f"   {desc}")
    print()
EOF
