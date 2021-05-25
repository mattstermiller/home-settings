# install apps
cinst firefox
cinst vim-tux
cinst microsoft-windows-terminal
cinst arsclip
#cinst katmouse
cinst autohotkey
cinst nircmd
cinst vlc
cinst irfanview
cinst 7zip
#cinst microsoft-teams
#cinst slack
#cinst gimp
#cinst screentogif
#cinst logitechgaming

# install dev tools
#cinst gitkraken
cinst vscode
#cinst jetbrains-rider
#cinst linqpad5
cinst dotnetcore-sdk
#cinst fake
#cinst visualstudio2019-workload-manageddesktopbuildtools
#cinst azure-cli
#cinst nodejs
#cinst yarn
#cinst smtp4dev
#cinst postman

# install plugins for apps
git clone https://github.com/VundleVim/Vundle.vim.git ../.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir ..\.vim\swap

code --install-extension Shan.code-settings-sync

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
