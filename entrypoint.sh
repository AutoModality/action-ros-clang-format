#!/bin/bash

set -e

name=$1
email=$2
message=$3

apt-get update
apt-get install -y curl

# keep in method to avoid parameter mingling
apply_style(){
  find . -name '*.h' -or -name '*.hpp' -or -name '*.cpp' | xargs clang-format-3.8 -i -style=file $1
}

curl -1sLf \
  'https://dl.cloudsmith.io/public/automodality/public/cfg/setup/bash.deb.sh' \
  | bash

apt-get install -y \
    libllvm3.8 \
    clang-format-3.8 \
    git

# according to docs, the --style=file will find the .clang-file at the root placed by the Dockerfile copy
# https://releases.llvm.org/3.8.0/tools/clang/docs/ClangFormat.html
# Use -style=file to load style configuration from
#                              .clang-format file located in one of the parent
#                              directories of the source file (or current
#                              directory for stdin).

echo "======================="
echo "Applying style to files"
echo "======================="

apply_style

git status | grep modified

if [[ $? == 0 ]] ;then
  echo "============================"
  echo "Committing to Current Branch"
  echo "============================"
  git config --global user.email "$email"
  git config --global user.name "$name"
  git commit -a -m "$message"
  git push origin HEAD
else
  echo "No changes to commit"
fi
