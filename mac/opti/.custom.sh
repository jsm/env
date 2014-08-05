# Rake autocomplete
source ~/.env/rake_autocomplete.sh

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
alias cdo="cd /o"
alias cdopt="cd /o/optimizely"
alias cdops="cd /o/opstimizely-culinaryinstitute"
alias gate="tail /o/optimizely/doc/gatekeeper.md"

export PROMPT_COMMAND="_update_ps1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH=/opt/chef/embedded/bin:$PATH

export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$PATH:$(find -L "/bin" -type d | sed "/\/\\./d" | tr "\n" ":" | sed "s/:$//")
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export PATH=/o/optimizely/out:$PATH
export PATH=/o/optimizely/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/o/optimizely/out/ec2_api_tools

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/cd" ]] && source "$HOME/.rvm/scripts/cd"

ssh-add ~/.ssh/id_rsa_optimizely

# Add arcanist to PATH environment variable
export PATH=/o/mytools/arcanist/bin:$PATH

# Add tab completion at the command-line
source /o/mytools/arcanist/resources/shell/bash-completion

# added by travis gem
[ -f /Users/jsm/.travis/travis.sh ] && source /Users/jsm/.travis/travis.sh

export COOKBOOK_PATH=/o/kitchen/cookbooks
