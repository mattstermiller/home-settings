param(
    [string]$GitRoot,
    [string]$FilePath
)

$RepoName = Split-Path -Leaf "$GitRoot"

Push-Location $GitRoot
$RelFilePath = Resolve-Path -Relative $FilePath
Pop-Location
$GitFilePath = $RelFilePath.TrimStart(".").Replace("\", "/")

Start-Process "https://brightstarcare.visualstudio.com/Athena%20Business%20System/_git/${RepoName}?path=$GitFilePath"
