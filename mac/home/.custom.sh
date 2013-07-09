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

export PROMPT_COMMAND="_update_ps1"
#. /Users/jsm/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
