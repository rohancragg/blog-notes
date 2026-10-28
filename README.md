# rohancragg's blog-notes repo-ho-ho

This repository contains source code for my MkDocs site hosted on [my GitHub Pages site (rohancragg.co.uk)](https://rohancragg.co.uk)

## Built with MkDocs

### Prerequisites

Use Git and Python 3.13, as specified in [.python-version](.python-version).
The site uses [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
and the plugins listed in [requirements.in](requirements.in).

### Local Setup

Run these commands from the repository root with [uv](https://docs.astral.sh/uv/getting-started/installation/).
It can download Python 3.13 if required:

```powershell
uv venv --python 3.13 .venv
uv pip sync --python .venv --require-hashes requirements.txt
```

Alternatively, with Python 3.13 already installed, use the standard library and pip.
On Windows:

```powershell
py -3.13 -m venv .venv
.\.venv\Scripts\python.exe -m pip install --require-hashes -r requirements.txt
```

On Linux or macOS:

```sh
python3.13 -m venv .venv
.venv/bin/python -m pip install --require-hashes -r requirements.txt
```

Keep `.venv` local and recreate it on each machine; it is ignored by Git.
Activation is optional when using the environment's Python executable directly.

### Preview and Validate

On Windows:

```powershell
.\.venv\Scripts\python.exe -m mkdocs serve
.\.venv\Scripts\python.exe -m mkdocs build --clean --strict
```

On Linux or macOS, use `.venv/bin/python` instead. The preview is available at
<http://127.0.0.1:8000/>. Generated output in `site/` is ignored by Git.

GitHub Actions installs the locked dependencies and runs a strict build on
Windows and Linux for pushes and pull requests. After both checks succeed, pushes
to `main` publish the site automatically. Pull requests never publish.
New, uncommitted pages have no Git revision date; the date plugin falls back to
today's date. Clone with full Git history for accurate revision dates.

### Update Dependencies

Edit [requirements.in](requirements.in), then regenerate the cross-platform,
hashed [requirements.txt](requirements.txt) lockfile with uv:

```powershell
uv pip compile requirements.in --python-version 3.13 --universal --generate-hashes --upgrade --output-file requirements.txt
uv pip sync --python .venv --require-hashes requirements.txt
```

Run the strict build and check the preview before committing both dependency
files. When changing Python versions, update `.python-version`, regenerate the
lockfile for that version, and recreate `.venv`.

### Publish

After merging to `main`, GitHub Actions builds and publishes the site to
`rohancragg/rohancragg.github.io`, branch `main`. Deployments are serialised and
preserve the custom domain `rohancragg.co.uk`. You can also use **Run workflow**
on the `main` branch to rebuild and publish manually.

Authentication uses the source repository's `GH_PAGES_DEPLOY_KEY` Actions secret.
Its public key is registered as a write-enabled deploy key only on the destination
repository. For a fork or a new destination, configure both halves of a dedicated
key pair; the default `GITHUB_TOKEN` cannot publish to another repository.
Never commit the private key. GitHub Pages on the destination must serve the root
of its `main` branch.

### Manual Fallback

Use PowerShell (PowerShell 7 on Linux/macOS) and Git credentials with write access
to the publishing repository. Check the destination without publishing:

```powershell
./gh-deploy.ps1 -WhatIf
```

To publish to `rohancragg/rohancragg.github.io`, branch `main`:

```powershell
./gh-deploy.ps1
```

The script runs a clean, strict build from the source checkout, then publishes
that output using a temporary clone. It stops on failures, restores the caller's
directory, and never resets the source checkout. No sibling checkout is required.
The destination repository and branch must already exist and can be overridden
with `-PublishRepository` and `-PublishBranch`. GitHub Pages must serve that branch.

### Theme Maintenance

Material for MkDocs reaches end of life on 5 May 2027. Assess its successor,
[Zensical](https://zensical.org/docs/compatibility/mkdocs/migration/), separately,
including plugin compatibility and the custom template in `theme/`.
