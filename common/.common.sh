CLICOLOR=1
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias sudo="sudo "

alias jserv="ssh -p 6464 -A jsm@sanmiguel.je"
alias sshbare="ssh -p 6464 -A jsm@108.166.120.88"
alias sshocf="ssh ssh.ocf.berkeley.edu"

alias cdcs="cd ~/Repositories/cs"
alias cdr="cd ~/Repositories/"
alias cdt="cd ~/Repositories/taghub"
alias cdb="cd ~/Repositories/bareapp"
alias cds="cd ~/Repositories/scripts"
alias cdp="cd ~/Repositories/projects"
alias cdc="cd ~/Repositories/current"
alias cdcc="cd ~/Repositories/cc/"
alias cdcc2="cd ~/Repositories/cc2/"
alias cdcc3="cd ~/Repositories/cc3/"
alias cdsv="cd ~/Repositories/sv/"
alias cdsvmain="cd ~/Repositories/sv/html/wp-content/themes/servio"
alias cdenv="cd ~/Repositories/env"
alias myenv="cd -P ~/.env"

alias ch="choose"

alias envup="(cdenv ; git pull)"
alias envst="(cdenv ; git st)"

gr () {
    cd $(git rev-parse --show-toplevel)
}

search () {
    find . -name \*$1\*
}

delete_all () {
    find . -type f -name $1 -o -type l -name $1 -exec rm -f {} \;
}
alias remove_all="delete_all"

jssh () {
    ssh -A jon@$1
}

sshcs70 () {
    ssh -A cs70-ox@$1
}

sshcs188 () {
    ssh -A cs188-my@$1
}

tc ()
{
    b=$1;
    if git checkout $b; then
	: true;
    else
	git checkout -b $b;
	git push origin $b;
	git branch --set-upstream $b origin/$b;
    fi
}

newrepo () {
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin git@github.com:sanmiguelje/$1.git
    git push -u origin master
}

sym () {
    mv $1 $2
    ln -s $2$1
}

setupwork () {
    rvm use 1.9.3-p194@cc --default
}

setuphome () {
    rvm use ruby-1.9.3-p392@home --default
}

setupgrading () {
    rvm use 1.9.3@grading --default
}

setupbare () {
    rvm use 1.9.3@bareapp --default
}

setuptag () {
    rvm use 1.9.3@tag --default
}

c () {
    gcc -std=c99 $1
    ./a.out
}

check () {
    mkdir ~/Repositories/tmp
    cd ~/Repositories/tmp
    git init
    git remote add origin cs61c-sx@hive3.cs.berkeley.edu:~cs61c/git/repos/cs61c-sx
    git pull origin $1
}

gg_replace() {
    if [[ "$#" == "0" ]]; then
        echo 'Usage:'
        echo '  gg_replace term replacement file_mask'
        echo
        echo 'Example:'
        echo '  gg_replace cappuchino cappuccino *.html'
        echo
    else
        find=$1; shift
        replace=$1; shift

        ORIG_GLOBIGNORE=$GLOBIGNORE
        GLOBIGNORE=*.*

        if [[ "$#" = "0" ]]; then
            set -- ' ' $@
        fi

        while [[ "$#" -gt "0" ]]; do
            for file in `git grep -l $find -- $1`; do
                sed -e "s/$find/$replace/g" -i'' $file
            done
            shift
        done

        GLOBIGNORE=$ORIG_GLOBIGNORE
    fi
}
gg_dasherize() {
    gg_replace $1 `echo $1 | sed -e 's/_/-/g'` $2
}

GStoVF () {
    for i in $(git grep --full-name -l "\"http:\/\/getsatisfaction\.com\/cloudcrowd\/topics[^\"]*\"")
    do
        perl -p -i -e 's/\"http:\/\/getsatisfaction\.com\/cloudcrowd\/topics[^\"]*\"/\"http:\/\/forum\.cloudcrowd\.com\"/g' $i
    done
    for i in $(git grep --full-name -l "getsatisfaction.com/cloudcrowd")
    do
        perl -p -i -e 's/getsatisfaction\.com\/cloudcrowd/forum\.cloudcrowd\.com/g' $i
    done
}
