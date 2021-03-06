# Rake autocomplete
source ~/.env/rake_autocomplete.sh

alias e="emacs -nw"

function _update_ps1() {
    export PS1="$(~/.powerline-shell.py $?)"
    echo -ne "\\033]0;${PWD##*/}\\007"
}

export PROMPT_COMMAND="_update_ps1"

ssh-add ~/.ssh/id_rsa_huddleup

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR="emacs -q -l ~/.emacs.slim"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias python="/usr/local/bin/python3"

export ANDROID_HOME="/Users/jsm/Library/Android/sdk"

# Firebase
export FIREBASE_PROJECT_ID=huddleup-jsm
export HUDDLEBOT_FIREBASE_KEY="-L4DKVBZlCVk0QNMGPGq"

# Android Studio
export PATH=$PATH:/Users/jsm/Library/Android/sdk/platform-tools

# Go
export GOPATH=/Users/jsm/go
export PATH=$PATH:$GOPATH/bin

# Huddle
alias cdb="cd $GOPATH/src/github.com/letshuddleup/backend"
alias cdg="cd $GOPATH/src/github.com/letshuddleup/gode"

# Electron Forge
[ -f /Users/jsm/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /Users/jsm/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash
