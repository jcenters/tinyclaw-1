#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="content-pm-feed_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:content-pm-feed\",\"message\":\"@content PM feed. Run: xurl timeline @firearmblog --limit 5 to check recent tweets and avoid duplication. Draft one tweet for @firearmblog using x-tweet-optimizer then josh-voice skills. Send draft to Josh via Telegram. Do NOT auto-post — Josh posts manually.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
