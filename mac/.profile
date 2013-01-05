source ~/.env/.custom.sh
source ~/.env/.common.sh

alias ls="ls -pFh"

function aquamacs2
 {
     # Create the files as needed -- not as good as raw emacs, but acceptable
     for f in "$@"
     do
         test -e $f || touch $f
     done
     open -a /Applications/Aquamacs2.app/ "$@"
 }

alias amacs="aquamacs"
alias amacs2="aquamacs2"
alias aamacs2="aquamacs2"
alias a="aquamacs"
alias a2="aquamacs2"
alias aa="aquamacs2"

alias mysql=mysql5
alias mysqldump=mysqldump5

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
