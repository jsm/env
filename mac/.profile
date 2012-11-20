source ~/.env/.custom.sh
source ~/.env/.common.sh

alias ls="ls -pFh"
alias amacs="aquamacs"
alias a="amacs"

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
