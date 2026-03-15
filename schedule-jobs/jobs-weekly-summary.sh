#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="jobs-weekly-summary_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:jobs-weekly-summary\",\"message\":\"@jobs Weekly job search summary. Review memory/ and compile: active applications, interviews scheduled, follow-ups needed, opportunities to pursue this week. Send clean summary to Josh via Telegram.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
