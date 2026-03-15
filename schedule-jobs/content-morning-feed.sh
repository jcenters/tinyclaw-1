#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="content-morning-feed_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:content-morning-feed\",\"message\":\"@content Morning content brief. Check recent news for TFB, AllOutdoor, OutdoorHub story opportunities. Identify 2-3 worth pursuing today. For each strong story draft a headline + 2-sentence pitch. Send brief to Josh via Telegram.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
