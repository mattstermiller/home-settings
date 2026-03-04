[CmdletBinding()]
param(
    [string] $Url,

    [Parameter(Mandatory = $false)]
    [string] $FilePath
)

$ErrorActionPreference = "Stop"

$webClient = New-Object System.Net.WebClient
$bytes = $webClient.DownloadData($Url)

[System.IO.Directory]::SetCurrentDirectory("$(Get-Location)")

if (-not $FilePath) {
    $FilePath = ([uri]$Url).Segments[-1]
}
$FilePath = [System.IO.Path]::GetFullPath($FilePath)

[System.IO.File]::WriteAllBytes($FilePath, $bytes)
Write-Host "Saved to file: $FilePath"

$sha384 = [System.Security.Cryptography.SHA384]::Create()
$hash = $sha384.ComputeHash($bytes)
$base64 = [System.Convert]::ToBase64String($hash)
$sri = "sha384-$base64"
Set-Clipboard $sri
Write-Host "Copied SRI to Clipboard: $sri"

