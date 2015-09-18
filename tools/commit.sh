#! /bin/sh

cd `dirname $0`/..

if [ "$#" = "1" -a "$1" = "--revert" ] ; then
  echo "ALL README.md FILES ARE GOING TO BE RESET, HIT CTRL-C TO STOP."
  sleep 10
  for dir in ../algoliasearch-client-*; do
    cd $dir
    echo "$dir"
    git reset ^HEAD
  done
  exit 0
fi

if [ "$#" = "1" -a "$1" = "--show" ] ; then
  echo "Generate README.mds"
  ruby ./doc-generator.rb config.json
  for dir in ../algoliasearch-client-*; do
    cd $dir
    echo "$dir"
    git diff README.md
  done
  exit 0
fi

if [ "$#" = "1" -a "$1" = "--prepare" ] ; then
  echo "prepare repos to update README.mds"
  ruby ./doc-generator.rb config.json
  for dir in ../algoliasearch-client-*; do
    cd $dir
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

for dir in ../algoliasearch-client-*; do
  echo "$dir/README.md"
  sleep 1
  cd $dir
  git diff README.md
  git commit README.md
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
