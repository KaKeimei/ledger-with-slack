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

echo "==========Assets and Liabilities=========\n" >> result.txt
ledger -f $FILE_PATH balance assets liabilities >> result.txt
echo "================Expenses=================\n" >> result.txt
ledger -f $FILE_PATH balance expenses >> result.txt
cat result.txt | ./slackcat -u $SLACK_WEBHOOK_URL