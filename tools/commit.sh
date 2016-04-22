#!/usr/bin/env bash

REPOS=("algoliasearch-client-go" "algoliasearch-client-csharp" "algoliasearch-client-swift" "algoliasearch-client-android" "algoliasearch-client-go" "algoliasearch-client-java" "algoliasearch-client-ruby" "algoliasearch-client-python" "algoliasearch-client-scala" "algoliasearch-client-objc" "algoliasearch-client-js" "algoliasearch-client-cmd" "algoliasearch-client-php" "algoliasearch-client-node")

#step 1 : clone
for repo in "${REPOS[@]}"; do
  if [ ! -d "$DIRECTORY" ]; then
    git clone "git@github.com:algoliareadmebot/"$repo
  fi
done

# step 2: rebase from origin
for dir in "${REPOS[@]}"; do
  if [[ $dir =~ readme-generator ]]; then
    continue;
  fi
  cd "$dir"
  git checkout master
  git pull -r "git@github.com:algolia/"$dir master
  cd ../
done

#step 3: generate readmes
ruby ./doc-generator.rb config.json

#step 4 ask for commit message
echo "Enter a commit message"
read commitMessage

#step 5 commit and push and pull request
for dir in "${REPOS[@]}"; do

  cd "$dir"
  git commit README.md -m "$commitMessage"
  if [ "$?" != "0" ] ; then
    echo "no commit added for "$dir
    continue;
  fi

  git push https://${GH_TOKEN}@github.com/algoliareadmebot/"$dir".git master
  if [ "$?" != "0" ] ; then
    echo "A problem happened while pushing"
    exit 1
  fi

  ruby ../send-pull-request.rb $dir
  if [ "$?" != "0" ] ; then
    echo "Cannot create pull request for some reason!"
    exit 1
  fi
  echo "Pull request created for "$dir
done
echo "the bot is done !"
exit 0
