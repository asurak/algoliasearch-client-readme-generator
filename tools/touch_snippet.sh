#! /bin/sh

if [ $# -ne 1 ]; then
  echo "usage: $0 snippet" >&2
  exit 1
fi

for lang in "Android" "C#" "Java" "JavaScript" "Objective-C" "PHP" "Python" "Ruby" "Shell" "Scala"; do
  touch "`dirname $0`/../include/$lang/$1.snippet"
done
