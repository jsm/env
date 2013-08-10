export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

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
}

alias ccat=/usr/bin/cat
alias cat="pygmentize -g"

export PROMPT_COMMAND="_update_ps1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=/opt/chef/embedded/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

