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
Search recent news for TFB, AllOutdoor, and OutdoorHub story opportunities. Identify 9 worth pursuing today. For each: one headline + two-sentence pitch. Send as '**STORY PITCHES:**' followed by the numbered list.

Silent execution — no narration between steps.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
