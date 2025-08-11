#!/bin/sh
if [ ${#1} -eq 0 ]; then
  echo "Enter commit string."
  exit 1
fi

echo "Wiping .ipynb_checkpoints"
find . -name '.ipynb_checkpoints' | awk '{print "rm -r "$1}' | /bin/sh
echo "Wiping other data."
rm -r Labs/8.1/data

echo "Using commit string: $1"
DATE=`date +%Y%m%d-%H%M`

echo "Adding Files."
git add . --all

echo "Committing Files."
git commit -m "$DATE $1"

echo "Pushing Files."
git push -u origin main
