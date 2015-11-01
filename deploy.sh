#!/bin/bash

# Build the project.
hugo

cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for sub_dir in ./public ./; do
  cd ${cur_dir}/$sub_dir
  if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "$1"
    git push origin master
  fi
done

