# Rake autocomplete
source ~/.env/rake_autocomplete.sh

alias e="emacs -nw"
alias cdb="cd ~/work/backend"
alias cdg="cd ~/work/backend/go/src/samsaradev.io"
alias tk="taskrunner"
alias aws-export="source ~/.env/aws.sh"

function acon() {
    (cd ~/work/backend && aws-okta login okta-$1)
}

function _update_ps1() {
    #    export PS1="$(~/.powerline-shell.py $?)"
    export PS1="$(/Users/jon.sanmiguel/work/backend/go/bin/powerline-go -theme ~/repos/env/common/powerline-theme.json -modules user,ssh,cwd,gitlite,exit,root -path-aliases \~/work/backend/go/src=@go/src -error $?)"
#     echo -ne "\\033]0;${PWD##*/}\\007"
}

export PROMPT_COMMAND="_update_ps1"

export EDITOR="emacs -q -l ~/.emacs.slim"

export GOPATH=$HOME/go
eval "$(direnv hook bash)"

ssh-add ~/.ssh/id_rsa_samsara

source ~/work/backend/bin/taskrunner-completion.bash
complete -F _taskrunner_completions tk

# Macdown
macdown() {
    "$(mdfind kMDItemCFBundleIdentifier=com.uranusjr.macdown | head -n1)/Contents/SharedSupport/bin/macdown" $@
}

#eval "$(rbenv init -)"
#eval "$(pyenv init -)"

ulimit -n 16384

export PATH=$PATH:/Users/jon.sanmiguel/Library/Application\ Support/JetBrains/Toolbox/scripts
