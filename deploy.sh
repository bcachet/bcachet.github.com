#!/bin/bash

# Build the project.
hugo

if [[ -n $(git status --porcelain) ]]; then
  git add -A
  git commit -m "$1"
  git push origin source
fi

git subtree push --prefix=public git@github.com:bcachet/bcachet.github.com.git master
