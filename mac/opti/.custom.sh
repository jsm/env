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
alias cdok="cd /o/kitchen"
alias cdor="cd /o/optimizelyrake"
alias gate="tail /o/optimizely/doc/gatekeeper.md"

export PROMPT_COMMAND="_update_ps1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH=/opt/chef/embedded/bin:$PATH

export PATH=/Users/jsm/Library/Python/2.7/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$PATH:$(find -L "/bin" -type d | sed "/\/\\./d" | tr "\n" ":" | sed "s/:$//")
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export PATH=/o/optimizely/out:$PATH
export PATH=/o/optimizely/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/o/optimizely/out/ec2_api_tools


ssh-add ~/.ssh/id_rsa_optimizely

# Add arcanist to PATH environment variable
export PATH=/o/mytools/arcanist/bin:$PATH

# Add tab completion at the command-line
source /o/mytools/arcanist/resources/shell/bash-completion

# added by travis gem
[ -f /Users/jsm/.travis/travis.sh ] && source /Users/jsm/.travis/travis.sh

#AWS CLI
source /Users/jsm/.aws

export COOKBOOK_PATH=/o/kitchen/cookbooks

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jsm/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

source /o/optimizely/.source_this.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias bfg="java -jar ~/Applications/bfg.jar"

export EDITOR="emacs -q -l ~/.emacs.slim"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jsm/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/jsm/google-cloud-sdk/completion.bash.inc'
