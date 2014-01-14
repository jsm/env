alias e="emacs -nw"

db_deploy () {
    bundle exec rake db:reset
    bundle exec rake db:populate
    bundle exec rake db:test:prepare
}
db_migrate() {
    bundle exec rake db:migrate
    bundle exec rake db:test:prepare
}

function _update_ps1() {
    export PS1="$(~/.powerline-shell.py $?)"
    echo -ne "\\033]0;${PWD##*/}\\007"
}

alias ccat=/bin/cat
alias cat="pygmentize -g"
alias cdo="cd /opti"

export PROMPT_COMMAND="_update_ps1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=/opt/chef/embedded/bin:$PATH

export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=/opti/optimizely/out:$PATH
export PATH=/opti/optimizely/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/opti/optimizely/out/ec2_api_tools
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export PATH=/opti/optimizely2/out:$PATH
export PATH=/opti/optimizely2/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/opti/optimizely2/out/ec2_api_tools

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/cd" ]] && source "$HOME/.rvm/scripts/cd"

ssh-add ~/.ssh/id_rsa_optimizely
