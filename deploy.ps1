
Remove-Item "dist" -Recurse -Force
npm run build
Set-Location .\dist

# add .nojekyll to bypass GitHub Page’s default behavior
New-Item ".nojekyll"

New-Item "CNAME" -Value "www.riddlebit.net"

git init
git switch -c gh-pages
git add -A
git commit -m 'deploy'
git push -f git@github.com:Riddlebit/riddlebit-website.git gh-pages
