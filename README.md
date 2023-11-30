# rohancragg's blog-notes repo-ho-ho

This repository contains source code for my MkDocs site hosted on [rohancragg.github.io](http://rohancragg.github.io)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/rohancragg/blog-notes)

## Built with MkDocs

### Install Pre-Requisites
If cloning onto a new (Windows) machine - bootstrap MkDocs like this:

```powershell
scoop install python
scoop install curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python -m pip install -U pip
```

### Install MkDocs

```powershell
pip install mkdocs
python $env:USERPROFILE\scoop\apps\python\current\Tools\scripts\win_add2path.py
```

### Install the Custom Theme

Using [Material theme](https://squidfunk.github.io/mkdocs-material/)

```powershell
pip install mkdocs-material
```

### Install MkDocs Extensions
```powershell
pip install -r ./requirements.txt
```

It can be previewed by running:

```powershell
mkdocs serve
```

It's deployed [like this:](https://www.mkdocs.org/user-guide/deploying-your-docs/#organization-and-user-pages)
```powershell
 .\gh-deploy.ps1
```
