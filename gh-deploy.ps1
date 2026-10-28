[CmdletBinding(SupportsShouldProcess = $true)]
param(
	[ValidateNotNullOrEmpty()]
	[string]$PublishRepository = 'https://github.com/rohancragg/rohancragg.github.io.git',
	[ValidateNotNullOrEmpty()]
	[string]$PublishBranch = 'main'
)

$ErrorActionPreference = 'Stop'
$pythonPath = Join-Path $PSScriptRoot '.venv/Scripts/python.exe'
if (-not (Test-Path $pythonPath)) {
	$pythonPath = Join-Path $PSScriptRoot '.venv/bin/python'
}
if (-not (Test-Path $pythonPath)) {
	throw 'Create .venv and install requirements.txt before deploying. See README.md.'
}
Get-Command git -ErrorAction Stop | Out-Null

if (-not $PSCmdlet.ShouldProcess("$PublishRepository ($PublishBranch)", 'Build and publish site')) {
	return
}

$publishDirectory = Join-Path ([System.IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString())
$siteDirectory = Join-Path $PSScriptRoot 'site'
Push-Location $PSScriptRoot
try {
	& $pythonPath -m mkdocs build --clean --strict
	if ($LASTEXITCODE -ne 0) {
		throw "MkDocs build failed with exit code $LASTEXITCODE."
	}

	git clone --single-branch --branch $PublishBranch -- $PublishRepository $publishDirectory
	if ($LASTEXITCODE -ne 0) {
		throw "Cloning the publishing repository failed with exit code $LASTEXITCODE."
	}

	Push-Location $publishDirectory
	try {
		& $pythonPath -m ghp_import -n -p -b $PublishBranch -r origin $siteDirectory
		if ($LASTEXITCODE -ne 0) {
			throw "Publishing failed with exit code $LASTEXITCODE."
		}
	}
	finally {
		Pop-Location
	}
}
finally {
	Pop-Location
	if (Test-Path $publishDirectory) {
		Remove-Item -LiteralPath $publishDirectory -Recurse -Force
	}
}