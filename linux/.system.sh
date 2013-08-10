
alias ls="ls -Fh --color=auto"

choose () {
PS3="Choose a file to edit: "
select opt in $(find . -name \*$1\*) quit
do
    if [[ $opt = "quit" ]]
    then
    break
    fi
    emacs "$opt" &
    break
    done
}

