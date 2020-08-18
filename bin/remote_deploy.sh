#!/usr/bin/env bash

cd app
git fetch &&
git reset --hard origin/master &&
export hash=$(git log -1 --pretty="%H") && # https://stackoverflow.com/questions/5025087/how-do-i-get-the-commit-id-of-the-head-of-master-in-git
docker build -t fang/morney:$hash . &&
export old=$(docker ps -q --filter name=morney*) &&
docker kill $old; docker rm $old
docker run --name morney-$hash \
  -e RAILS_ENV=production \
  -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
  -e smtp_username=$smtp_username \
  -e smtp_password=$smtp_password \
  --net=host -p 3000:3000 -d fang/morney:$hash
