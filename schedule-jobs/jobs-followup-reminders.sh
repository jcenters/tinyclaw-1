#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="jobs-followup-reminders_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:jobs-followup-reminders\",\"message\":\"@jobs Check memory/ for job applications needing follow-up (5-7 days no response) or upcoming interview dates. Send Josh reminders only if there are actionable items. Stay quiet if nothing needs attention.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
