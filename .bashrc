export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

alias ll="ls -l"
alias ld="ls -d */"

alias gits="git status"
alias gita="git add -A"
alias gitc="git commit -m"
alias gitp="git pull"
alias gitpr="git pull --rebase"
alias gitco="git checkout"
alias gitm="git merge"
alias gitmnff="git merge --no-ff"
alias gitdeploy="gitco develop && git push && gitco master && gitm origin/master && gitmnff develop --no-edit && git push && gitco develop"

alias windir='sed s,^/c,c:,g | sed s,/,\\\\,g'
alias explore='/c/windows/explorer `echo $PWD | windir`'

alias k8s-nphi-dev="az account set --subscription d5bb4703-0f15-481f-ab1c-9e5672c63b1f;az aks get-credentials --resource-group USC-RD-Canopy-RG --name aks-canopy-dev"
alias k8s-dev="az account set --subscription ab875ab8-87c3-4db5-b508-61706a0467dc;az aks get-credentials --resource-group aks-canopy-dev --name aks-pri-canopy-dev"
alias k8s-uat="az account set --subscription bf6ec698-9ef6-48fc-9f84-38a618677f6d;az aks get-credentials --resource-group aks-canopy-uat --name aks-pri-canopy-uat"
alias k8s-prod="az account set --subscription 71745393-240e-4551-8a05-8a66edddbfe7;az aks get-credentials --resource-group aks-canopy-prod --name aks-pri-canopy-prod"

function cd {
    if [[ ".lnk" = "${1:(-4)}" && -f "$1" ]] ;
        then builtin cd "$( follow "$1" )" ;
    else builtin cd "$1" ;
    fi
}

function base64d() {
    echo "$1" | base64 -d
}

