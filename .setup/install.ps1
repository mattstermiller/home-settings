# install apps
choco install firefox
choco install vim
choco install microsoft-windows-terminal
choco install arsclip
#choco install katmouse
choco install autohotkey
choco install nircmd
choco install vlc
choco install irfanview
choco install 7zip
#choco install microsoft-teams
#choco install slack
#choco install gimp
#choco install screentogif
#choco install logitechgaming

# install dev tools
choco install gitkraken
choco install p4merge
choco install vscode
#choco install jetbrains-rider
#choco install linqpad5
choco install dotnet-sdk
#choco install fake
#choco install visualstudio2019-workload-manageddesktopbuildtools
#choco install azure-cli
#choco install nodejs
#choco install yarn
#choco install smtp4dev
#choco install postman

# install plugins for apps
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
vim +PlugInstall
mkdir ..\vimfiles\swap

code --install-extension Shan.code-settings-sync

# copy nuget.config since SDK does not create it
copy .\NuGet.Config ..\AppData\Roaming\NuGet\

# add pins for apps that aggressively auto-update
choco pin add -n=firefox
choco pin add -n=foxitreader
choco pin add -n=gitkraken
choco pin add -n=googlechrome
choco pin add -n=kb2533623
choco pin add -n=steam
choco pin add -n=vcredist140
choco pin add -n=vscode
choco pin add -n="vscode.install"

# generate shims
& "$env:ChocolateyInstall\tools\shimgen.exe" -p "$env:ChocolateyInstall\tools\shimgen.exe" -o "$env:ChocolateyInstall\bin\shimgen.exe"
shimgen -p "C:\Program Files\Git\git-bash.exe" -o "$env:ChocolateyInstall\bin\git-bash.exe"

# system settings
& "$env:userprofile\.ahk\hotkeys.ahk"
nircmd shortcut "$env:userprofile\.ahk\hotkeys.ahk" '~$folder.startup$' "Hotkeys"
$startMenu = "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
copy "$startMenu\ArsClip.lnk" "$startMenu\Startup"

REGEDIT /S CapsToControl-ScrollToCaps.reg
