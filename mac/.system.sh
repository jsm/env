
alias ls="ls -pFh"

alias amacs="aquamacs"
alias a="aquamacs"

choose () {
    PS3="Choose a file to edit: "
    select opt in $(find . -name \*$1\*) quit
    do
    if [[ $opt = "quit" ]]
    then
        break
    fi
    amacs "$opt" &
    break
    done
}

cmate () {
    PS3="Choose a file to edit: "
    select opt in $(find . -name \*$1\*) quit
    do
    if [[ $opt = "quit" ]]
    then
        break
    fi
    mate "$opt" &
    break
    done
}

ggc () {
    git grep "$1"
    PS3="Choose a file to edit: "
    select opt in $(git grep -l "$1") quit
    do
    if [[ $opt = "quit" ]]
    then
        break
    fi
    amacs "$opt" &
    break
    done
}

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1”
