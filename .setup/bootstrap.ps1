# 1. save this file to your user directory
# 2. open powershell as admin
# 3. cd to your user directory
# 4. if you didn't already, allow running ps scripts: set-executionpolicy remotesigned
# 5. run this script: ./bootstrap.ps1
# 6. delete this script
# 7. cd to .setup
# 8. review and edit install.ps1 to install apps as desired
# 9. run ./install.ps1

# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

# install git and refresh path
choco install git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# clone this repo
git init
git remote add origin https://github.com/mattstermiller/home-settings.git
git fetch
git reset origin/master
git branch --set-upstream-to=origin/master
git checkout HEAD -- .
