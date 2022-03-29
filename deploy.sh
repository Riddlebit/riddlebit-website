#!/usr/bin/env sh

set -e

npm run build

cd dist

touch .nojekyll
echo 'staging.riddlebit.net' > CNAME

git add -A
git commit -m 'deploy'

git push -f origin gh-pages
