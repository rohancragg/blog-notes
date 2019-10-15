cd ..\rohancragg.github.io
mkdocs gh-deploy --config-file ../blog-notes/mkdocs.yml --remote-branch master
git reset --hard
cd ..\blog-notes