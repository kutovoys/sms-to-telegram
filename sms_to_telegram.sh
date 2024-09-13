#!/bin/sh
for i in `seq $SMS_MESSAGES` ; do
    number=SMS_${i}_NUMBER
    text=SMS_${i}_TEXT
    eval number_str=\$${number}
    eval text_str=\$${text}
    message="${number_str}:\n${text_str}"
    eval "curl -i -X GET https://api.telegram.org/bot${BOT_TOKEN}/sendMessage -H \"Content-Type: application/json\" -X POST -d '{\"chat_id\":\"${CHAT_ID}\",\"text\":\"${message}\"}'"
done