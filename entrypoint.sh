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

echo "===Assets & Liabilities===\n" >> result.txt
ledger -f $FILE_PATH balance assets liabilities >> result.txt

# echo "==========Total Expenses========\n" >> result.txt
# ledger -f $FILE_PATH balance expenses >> result.txt

echo "===This Month==\n" >> result.txt
ledger -p "this month" --cleared-format="%(justify(scrub(get_at(display_total, 0)), 16, 16 + int(prepend_width),true, color))  %-(ansify_if(partial_account(options.flat), blue if color))\n\n" cleared Expenses:日元 -f $FILE_PATH >> result.txt
cat result.txt | ./slackcat -u $SLACK_WEBHOOK_URL