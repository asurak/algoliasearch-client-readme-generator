#!/usr/bin/env bash

cd "$(dirname "$0")/.."

# Clean the staging index of all sub-repos, reverting to the latest commit
if [ "$#" = "1" -a "$1" = "--revert" ] ; then
  echo "ALL README.md FILES ARE GOING TO BE RESET, HIT CTRL-C TO STOP."
  sleep 10
  for dir in ../algoliasearch-client-*; do
    if [[ $dir =~ readme-generator ]]; then
      continue;
    fi
    cd "$dir"
    echo "$dir"
    git reset --hard
  done
  exit 0
fi

# Show the diff of all subrepos
if [ "$#" = "1" -a "$1" = "--show" ] ; then
  echo "Generate README.mds"
  ruby ./doc-generator.rb config.json
  for dir in ../algoliasearch-client-*; do
    if [[ $dir =~ readme-generator ]]; then
      continue;
    fi
    cd "$dir"
    echo "$dir"
    git diff README.md
  done
  exit 0
fi

# Update all subrepos to the latest master
if [ "$#" = "1" -a "$1" = "--prepare" ] ; then
  echo "prepare repos to update README.mds"
  ruby ./doc-generator.rb config.json
  for dir in ../algoliasearch-client-*; do
    if [[ $dir =~ readme-generator ]]; then
      continue;
    fi
    cd "$dir"
    echo "$dir"
    git checkout README.md; git pull -r
  done
  exit 0
fi


if [ "$#" != "1" -o "$1" != "--push" ] ; then
  echo "Usage: ./commit {--show|--revert|--push|--prepare}"
  exit 1
fi

echo "Generate README.mds"
ruby ./doc-generator.rb config.json
if [ "$?" != "0" ] ; then
  echo "Generation failed: stop"
  exit 1
fi


echo "Enter the commit message:"
read commitMessage

for dir in ../algoliasearch-client-*; do
  if [[ $dir =~ readme-generator ]]; then
    continue;
  fi
  echo "$dir/README.md"
  sleep 1
  cd "$dir"
  git diff README.md
  git commit README.md -m "$commitMessage"
  git pull -r
  if [ "$?" != "0" ] ; then
    echo "Pull refused stop"
    exit 1
  fi
  git push
  if [ "$?" != "0" ] ; then
    echo "Push refused stop"
    exit 1
  fi
done

echo "README.mds committed !"
exit 0
