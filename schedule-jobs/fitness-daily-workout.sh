#!/bin/bash
API_BASE="http://localhost:3777"
TS=$(date +%s)
MSG_ID="fitness-daily-workout_${TS}_$$"
curl -s -X POST "${API_BASE}/api/message"     -H "Content-Type: application/json"     -d "{\"channel\":\"schedule\",\"sender\":\"Scheduler\",\"senderId\":\"tinyclaw-schedule:fitness-daily-workout\",\"message\":\"@fitness Run the daily workout scheduler. Check weather/temp, select equipment per rules in CLAUDE.md, design a 20-min RPE 7-8 workout (no barbell squats), book it on gog calendar (josh.centers@gmail.com), send Josh a Telegram summary with workout plan and calendar link.\",\"messageId\":\"${MSG_ID}\"}"     > /dev/null 2>&1
