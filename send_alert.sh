#!/bin/sh -e

# I really don't have any time
# Copied from https://www.forsomedefinition.com/automation/creating-telegram-bot-notifications/

CHATID="`cat tg_chat`"
KEY="`cat tg_token`"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="$@"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL >/dev/null
