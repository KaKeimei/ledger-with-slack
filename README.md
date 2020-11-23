# ledger-with-slack
docker container, ledger cli with slack bot

need slack webhook url to send message.

usage:
```
 docker run --rm -v $(pwd):/data ledger-with-slack -u $SLACK_WEBHOOK_URL -f /data/$LEDGER_FILE
```

cleared format:
```
"%(justify(scrub(get_at(display_total, 0)), 16, 16 + int(prepend_width),true, color))  %-(ansify_if(partial_account(options.flat), blue if color))\n\n"
```