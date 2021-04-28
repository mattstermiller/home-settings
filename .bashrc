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

function cd {
    if [[ ".lnk" = "${1:(-4)}" && -f "$1" ]] ;
        then builtin cd "$( follow "$1" )" ;
    else builtin cd "$1" ;
    fi
}
