#!/usr/bin/env sh

# abort on errors
set -e

rm -rf dist
npm run build
cd dist

# add .nojekyll to bypass GitHub Page’s default behavior
touch .nojekyll

echo 'www.riddlebit.net' > CNAME

git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:Riddlebit/riddlebit-website.git main:gh-pages
