#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="fitness-weekly-weight_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:fitness-weekly-weight\",\"message\":\"@fitness Sunday weigh-in prompt. Send Josh a Telegram message asking him to step on the scale and report his weight. Note lipid recheck is due ~May 2026.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
