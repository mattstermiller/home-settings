param(
    [string]$GitRoot,
    [string]$FilePath
)

$RepoName = Split-Path -Leaf "$GitRoot"
$EncodedRepo = [uri]::EscapeDataString($RepoName)

Push-Location $GitRoot
$RelFilePath = Resolve-Path -Relative -LiteralPath $FilePath
Pop-Location
$GitFilePath = $RelFilePath.Replace("\", "/") -replace '^\./', ''
$EncodedPath = [uri]::EscapeDataString("/$GitFilePath")

Start-Process "https://brightstarcare.visualstudio.com/Athena%20Business%20System/_git/${EncodedRepo}?path=$EncodedPath"

