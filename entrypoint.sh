#!/bin/sh -l

apt update
apt install -y curl

curl -1sLf \
  'https://dl.cloudsmith.io/public/automodality/public/cfg/setup/bash.deb.sh' \
  | sudo bash

apt install -y \
    libllvm3.8 \
    clang-format-3.8

cp /.clang-format .

find . -name '*.h' -or -name '*.hpp' -or -name '*.cpp' | xargs clang-format-3.8 -i -style=file $1

git status