[CmdletBinding()]
param([string] $FilePathOrUrl)

if (Test-Path $FilePathOrUrl) {
    $bytes = [System.IO.File]::ReadAllBytes($FilePathOrUrl)
} else {
    $webClient = New-Object System.Net.WebClient
    $bytes = $webClient.DownloadData($FilePathOrUrl)
}

$sha384 = [System.Security.Cryptography.SHA384]::Create()
$hash = $sha384.ComputeHash($bytes)
$base64 = [System.Convert]::ToBase64String($hash)
Set-Clipboard "sha384-$base64"
Write-Host "sha384-$base64"
Write-Host "Copied to Clipboard."

