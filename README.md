# ledger-with-slack
docker container, ledger cli with slack bot

need slack webhook url to send message.

usage:
```
 docker run --rm -v $(pwd):/data ledger-with-slack -u $SLACK_WEBHOOK_URL -f /data/$LEDGER_FILE
```