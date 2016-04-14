#!/bin/bash
set -e # exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

# Save some useful information
REPO=`git config remote.origin.url`
REPO_WITH_TOKEN=${REPO/https:\/\/github.com\//https://${GH_TOKEN}@github.com/}
SHA=`git rev-parse --verify HEAD`

# Clone the existing gh-pages for this repo into out/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
git clone $REPO out
cd out
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
cd ..

# Clean out existing contents
rm -rf out/**/* || exit 0

# Now let's go have some fun with the cloned repo
cd out
git config user.name "Travis CI"
git config user.email "x0003000x@gmail.com"

# If there are no changes (e.g. this is a README update) then just bail.
if [ -z `git diff --exit-code` ]; then
    echo "No changes to the spec on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add .
git commit -m "Deploy to GitHub Pages: ${SHA}"
git push $REPO_WITH_TOKEN $TARGET_BRANCH
