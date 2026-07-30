$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot

function Assert-Contains {
    param(
        [string]$Path,
        [string]$Pattern
    )

    $content = Get-Content -LiteralPath (Join-Path $root $Path) -Raw
    if ($content -notmatch $Pattern) {
        throw "$Path does not match required pattern: $Pattern"
    }
}

$domains = Get-Content -LiteralPath (Join-Path $root "lists/list-general.txt")
if ($domains -notcontains "archiveofourown.org") {
    throw "lists/list-general.txt is missing archiveofourown.org"
}

Assert-Contains "utils/targets.txt" 'AO3Main\s*=\s*"https://archiveofourown\.org"'
Assert-Contains "utils/targets.txt" 'AO3Works\s*=\s*"https://archiveofourown\.org/works"'
Assert-Contains "general (AO3).bat" '--hostlist-domains=archiveofourown\.org'
Assert-Contains "general (AO3).bat" '--filter-tcp=80,443'
Assert-Contains "README-AO3-ZH.md" 'archiveofourown\.org'
Assert-Contains "service.bat" 'huanfeng123/zapret-ao3'
Assert-Contains "service.bat" 'set "LOCAL_VERSION=1\.10\.0-ao3\.1"'
Assert-Contains ".service/version.txt" '^1\.10\.0-ao3\.1\s*$'
Assert-Contains ".github/workflows/ao3-package.yml" 'name:\s*zapret-ao3-windows'
Assert-Contains ".github/workflows/ao3-package.yml" 'tag_name:\s*1\.10\.0-ao3\.1'

Write-Host "AO3 support checks passed."
