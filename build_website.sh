#!/bin/bash

set -e

bundle exec jekyll build
cp -r _site /tmp/
git checkout gh-pages
rm -rf *
cp -r /tmp/_site/* ./
git add -A
git commit -m "Update site content $(date +%Y-%m-%d %H:%M:%S)"
git push origin gh-pages
rm -rf /tmp/_site