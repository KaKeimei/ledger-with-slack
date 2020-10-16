#!/bin/bash

func() {
    echo "Usage:"
    echo "entrypoint.sh [-u SLACK_WEBHOOK_URL] [-f FILE_PATH]"
    echo "Description:"
    echo "SLACK_WEBHOOK_URL, slack webhook."
    echo "FILE_PATH,the path of destination."
    exit -1
}

while getopts 'u:f:h' OPT; do
    case $OPT in
        u) SLACK_WEBHOOK_URL="$OPTARG";;
        f) FILE_PATH="$OPTARG";;
        h) func;;
        ?) func;;
    esac
done

echo "==========Assets and Liabilities=========\n" | ./slackcat -u $SLACK_WEBHOOK_URL
ledger -f $FILE_PATH balance assets liabilities | ./slackcat -u $SLACK_WEBHOOK_URL
echo "==========Expenses=========\n" | ./slackcat -u $SLACK_WEBHOOK_URL
ledger -f $FILE_PATH balance expenses | ./slackcat -u $SLACK_WEBHOOK_URL