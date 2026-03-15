#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="content-morning-feed_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:content-morning-feed\",\"message\":\"@content Morning report. Do all three parts in order, then send via Telegram.

PART 1 — CHAPTER HOUSE TWEET
Check the current liturgical season and any trending classical education or parenting topics. Draft one Chapter House tweet using the chapter-house skill and josh-voice. Use first person plural (we). Link to https://chapter.house. Send as two messages: first '**CHAPTER HOUSE:**', then the tweet text.

PART 2 — TFB TWEET
Fetch https://www.thefirearmblog.com (maxChars: 4000). Pick the newest or most interesting article. Draft one tweet using the x-tweet-optimizer skill then refine with josh-voice. Include the real article URL. Send as two messages: first '**TFB:**', then the tweet text.

PART 3 — STORY PITCHES
Use the web-search skill to find story opportunities for TFB, AllOutdoor, and OutdoorHub. Run 2-3 searches with freshness set to past week — e.g. 'new pistol rifle shotgun suppressor announcement', 'hunting outdoor gear news', 'firearms industry news'. Exclude results from these sites: thefirearmblog.com, alloutdoor.com, outdoorhub.com, thetruthaboutguns.com. If you need full article content to write a better pitch, fetch it with Scrapling (python3 -c "from scrapling.fetchers import Fetcher; page = Fetcher().get('URL'); print(page.get_all_text()[:2000])"). Identify 9 stories worth pursuing today. For each: one headline, a two-sentence pitch, and the full source URL. Send as '**STORY PITCHES:**' followed by the numbered list.

Silent execution — no narration between steps.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
