# Rake autocomplete
source ~/.env/rake_autocomplete.sh

alias e="emacs -nw"
alias c="cursor"
alias cdb="cd ~/work/backend"
alias cdb2="cd ~/work2/backend"
alias cdg="cd ~/work/backend/go/src/samsaradev.io"
alias cdg2="cd ~/work2/backend/go/src/samsaradev.io"
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

source ~/work/backend/bin/taskrunner-completion.bash
complete -F _taskrunner_completions tk

# Macdown
macdown() {
    "$(mdfind kMDItemCFBundleIdentifier=com.uranusjr.macdown | head -n1)/Contents/SharedSupport/bin/macdown" $@
}

#eval "$(rbenv init -)"
#eval "$(pyenv init -)"

ulimit -n 16384


export PATH=$PATH:/Applications/GoLand.app/Contents/MacOS

oncall-update() {
    SECRET_app_oncall_health_pagerduty_token=$(aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:us-west-2:160875005101:secret:prod/app/oncall_health_pagerduty_token --region us-west-2 --profile sreadmin | jq -r .SecretString) SECRET_app_oncall_health_slack_api_token=$(aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:us-west-2:160875005101:secret:prod/app/oncall_health_slack_api_token --region us-west-2 --profile sreadmin | jq -r .SecretString) SECRET_app_oncall_health_github_token=$(aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:us-west-2:160875005101:secret:prod/app/oncall_health_github_token --region us-west-2 --profile sreadmin | jq -r .SecretString) please send-oncall-health-update sre D073S7NMGHK
}

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
