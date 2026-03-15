---
name: web-search
description: "Search the web using the Brave Search API. Use when you need current news, recent events, pricing, product info, or any information that may have changed since your training cutoff. Triggers: 'search for', 'look up', 'find recent', 'what's the latest on', 'news about', or any query requiring up-to-date information from the web."
---

# Web Search

Search the web via Brave Search API. Returns titles, URLs, and descriptions for the top results.

## Usage

```bash
<skill_dir>/scripts/web-search.sh "your search query"
```

### Options

```bash
<skill_dir>/scripts/web-search.sh "query" --count 5         # Number of results (default: 10, max: 20)
<skill_dir>/scripts/web-search.sh "query" --freshness pd    # pd=past day, pw=past week, pm=past month
<skill_dir>/scripts/web-search.sh "query" --count 5 --freshness pw
```

## Output

Returns a numbered list:

```
1. [Title]
   URL: https://...
   Description: ...

2. [Title]
   ...
```

## Notes

- API key is read from 1Password at runtime — requires `OP_SERVICE_ACCOUNT_TOKEN` in environment
- Use `--freshness pd` for breaking news or same-day story pitches
- Combine with `agent-browser` to fetch full article content after identifying URLs
