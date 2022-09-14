#!/bin/bash

if [[ -n "$1" ]]
then
  TAG="$1"
  EXISTS=$(git tag | grep "^${TAG}\$")
  if [[ -n "$EXISTS" ]]
  then
    echo "Deleting local tag"
    git tag --delete origin "$TAG"
    echo "Deleting existing tag from origin"
    git push --delete origin "$TAG"
  fi
    git tag -am "Adding tag: $TAG" "$TAG"
    git push --tags
else
  echo "usage: $(basename "$0") tag"
  exit 1
fi

