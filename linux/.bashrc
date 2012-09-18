source ~/env/.custom.sh
source ~/env/.common.sh


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

hp1 () {
    make
    rm -rf iDir
    rm -rf oDir
    hadoop jar proj1.jar  Proj1 -conf conf.xml billOfRights.txt.seq iDir oDir
}

hp1c () {
    make
    rm -rf iDir
    rm -rf oDir
    hadoop jar proj1.jar  Proj1 -Dcombiner=true -conf conf.xml billOfRights.txt.seq iDir oDir
}
