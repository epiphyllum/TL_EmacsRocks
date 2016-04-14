#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

# Create public folder
rm -rf public
mkdir public

# config
git config user.email "nobody@nobody.com"
git config user.name "Travis CI"

# make
pandoc README.org -o ./public/index.html

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git push -f "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
