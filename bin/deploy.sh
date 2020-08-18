#!/usr/bin/env bash

# https://stackoverflow.com/a/25149786/1262580
export changes=$(git status --porcelain --untracked-files=no)
echo $changes
if [[ $changes ]]; then
  echo 'Please commit your code!'
  exit 1
else
  ssh morney@server1 'bash -s' < bin/remote_deploy.sh
  echo "OK!"
  exit 0
fi
