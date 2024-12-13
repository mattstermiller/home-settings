# 1. Open Powershell as Administrator
# 2. `cd` to your user directory
# 3. Execute this script by running:
#      Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattstermiller/home-settings/refs/heads/master/.setup/bootstrap.ps1'))
#    OR if this is not allowed, save this script to your user directory and run:
#      Set-ExecutionPolicy Bypass -Scope Process -Force; .\bootstrap.ps1
#    ...then delete this script
# 4. `cd` to .setup/
# 5. Review install.ps1 and edit app list as desired
# 6. Run ./install.ps1

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

# Install git and refresh path
choco install git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Clone this repo
git init
git remote add origin https://github.com/mattstermiller/home-settings.git
git fetch
git reset origin/master
git branch --set-upstream-to=origin/master
git checkout HEAD -- .
