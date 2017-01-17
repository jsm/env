source ~/work/optimizely/.source_this.sh

# Rake autocomplete
source ~/.env/rake_autocomplete.sh

alias e="emacs -nw"
alias worklog="s '/Users/jsm/Dropbox (Personal)/Documents/Work/worklog.txt'"

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

alias cdo="cd /o"
alias cdopt="cd ~/work/optimizely"
alias cdops="cd ~/work/opstimizely-culinaryinstitute"
alias cdok="cd ~/work/kitchen"
alias cdor="cd ~/work/optimizelyrake"
alias gate="tail ~/work/optimizely/doc/gatekeeper.md"

export PROMPT_COMMAND="_update_ps1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH=/opt/chef/embedded/bin:$PATH

export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

ssh-add ~/.ssh/id_rsa_optimizely

# Add arcanist to PATH environment variable
export PATH=~/work/mytools/arcanist/bin:$PATH

# Add tab completion at the command-line
source ~/work/mytools/arcanist/resources/shell/bash-completion

# added by travis gem
[ -f /Users/jsm/.travis/travis.sh ] && source /Users/jsm/.travis/travis.sh

export COOKBOOK_PATH=~/work/kitchen/cookbooks

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias bfg="java -jar ~/Applications/bfg.jar"

export EDITOR="emacs -q -l ~/.emacs.slim"

# The next line enables shell command completion for gcloud.
source "$HOME/.google-cloud-sdk/completion.bash.inc"

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/.google-cloud-sdk/path.bash.inc"

# Android Studio
export PATH=$PATH:/Users/jsm/Library/Android/sdk/platform-tools

# Primordia
source /Users/jsm/work/primordia/.source_this.sh
