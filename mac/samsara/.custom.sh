# Rake autocomplete
source ~/.env/rake_autocomplete.sh

alias e="emacs -nw"

function _update_ps1() {
    export PS1="$(~/.powerline-shell.py $?)"
    echo -ne "\\033]0;${PWD##*/}\\007"
}

export PROMPT_COMMAND="_update_ps1"

export EDITOR="emacs -q -l ~/.emacs.slim"
