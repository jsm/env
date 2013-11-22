export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

alias e="emacs -nw"
alias rv="ruby -e 'print RUBY_VERSION'"
alias tar="gtar"

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

alias ccat="/bin/cat"
alias cat="pygmentize -g"

export PROMPT_COMMAND="_update_ps1"
export CATALINA_HOME="/opt/boxen/homebrew/Cellar/tomcat/7.0.41"
export CATALINA_OPTS="$CATALINA_OPTS -Drun.env=stage"

source /opt/boxen/env.sh

[ -f `brew --prefix`/etc/bash_completion ] && source `brew --prefix`/etc/bash_completion
