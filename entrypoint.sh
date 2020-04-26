#!/bin/sh -l

set -e

apt-get update
apt-get install -y curl

curl -1sLf \
  'https://dl.cloudsmith.io/public/automodality/public/cfg/setup/bash.deb.sh' \
  | bash

apt-get install -y \
    libllvm3.8 \
    clang-format-3.8 \
    git

cp /.clang-format .
find . -name '*.h' -or -name '*.hpp' -or -name '*.cpp' | xargs clang-format-3.8 -i -style=file $1

git status

git add  .
git commit -m "Code Format: Applied ROS Style"
git push origin HEAD