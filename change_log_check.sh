#!/bin/bash
if git show --format=%B --quiet "${TRAVIS_PULL_REQUEST_SHA:-${TRAVIS_TAG:-${TRAVIS_COMMIT}}}" \
 | grep '\[changelog skip\]' > /dev/null; then
echo "Skip changelog checker..."
elif [[ "$TRAVIS_TAG" != "" ]]; then
! grep -i "to be released" CHANGES.md
else
[[ "$TRAVIS_COMMIT_RANGE" = "" ]] || \
[[ "$(git diff --name-only "$TRAVIS_COMMIT_RANGE" | grep CHANGES\.md)" != "" ]]
fi

