mkdocs build --clean
cd ..\rohancragg.github.io
git pull
# deploying with --dirty to skip an error with using the git-revision-date plugin
mkdocs gh-deploy --dirty --config-file ../blog-notes/mkdocs.yml --remote-branch main
git reset --hard
cd ..\blog-notes