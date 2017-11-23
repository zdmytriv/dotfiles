#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Please provide pull request id as argument for this script."
    exit 1
fi

PREFIX=pr_
PULL_REQUEST_ID=$1
BRANCH_NAME=$PREFIX$PULL_REQUEST_ID

#IFS=$'\n' GLOBIGNORE='*' command eval  'BRANCHES=($(git branch))'

echo "*** Switching to master ..."
git checkout master
echo ""
echo ""

echo "*** Deleting branch '$BRANCH_NAME' if exists ..."
git branch -D $BRANCH_NAME
echo ""
echo ""

echo "*** Fetching pull request into branch '$BRANCH_NAME'"
git fetch upstream pull/$PULL_REQUEST_ID/head:$BRANCH_NAME
echo ""
echo ""

echo "*** Switching to new branch $BRANCH_NAME"
git checkout $BRANCH_NAME
echo ""
echo ""

echo "*** Your branches:"
git branch
