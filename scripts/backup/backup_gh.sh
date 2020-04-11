#!/usr/bin/env bash

usage()
{
    echo "Usage:"
    echo `basename $0`" <org-name>"
    echo "Example:"
    echo `basename $0`" zdmytriv"
    exit 1
}
[[ "$#" -ne 1 ]] && usage;

ORGANIZATION=$1
ACCESS_TOKEN=$(pass personal/github.com/access_token)

IFS=$'\n'
for clone_url in $(curl "https://api.github.com/users/${ORGANIZATION}/repos?access_token=${ACCESS_TOKEN}&per_page=1000" --silent | jq ".[].ssh_url" --raw-output)
do
  echo ">>>>>>>>>>>>>: ${clone_url}"
  git clone ${clone_url}
done