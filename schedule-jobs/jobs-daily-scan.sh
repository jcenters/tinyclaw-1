#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="jobs-daily-scan_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:jobs-daily-scan\",\"message\":\"@jobs Daily job scan. Search for new content/SEO/editorial director roles matching Josh's profile (content marketing, SEO, firearms/outdoor, SaaS editorial). Log strong matches to memory/. Send Telegram summary of new opportunities found.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
