CLICOLOR=1
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias sudo="sudo "

alias sshcs="ssh cs61c-sx@hive8.cs.berkeley.edu"

alias cdcs="cd ~/Repositories/cs"
alias cdr="cd ~/Repositories/"
alias cdcc="cd ~/Repositories/cc/"
alias cdcc2="cd ~/Repositories/cc2/"
alias cdcc3="cd ~/Repositories/cc3/"
alias cdsv="cd ~/Repositories/sv/"
alias cdsvmain="cd ~/Repositories/sv/html/wp-content/themes/servio"
alias cdenv="cd ~/Repositories/env"
alias myenv="cd -P ~/.env"

alias ch="choose"

alias mysql=mysql5
alias mysqldump=mysqldump5

alias envup="(cdenv ; git pull)"

gr () {
    cd $(git rev-parse --show-toplevel)
}

search () {
find . -name \*$1\*
}

jssh () {
ssh -A jon@$1
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
    rvm use ree@cc --default
}

setuphome () {
    rvm use ruby-1.9.3-p194@home --default
}

setupgrade () {
    rvm use 1.9.3@cc --default
}

c () {
    gcc -std=c99 $1
    ./a.out
}

submit () {
    git commit -m $1" submission"
    git tag -f $1
    git push -f --tags origin master
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

GStoVFsub () {
    for i in $(git grep --full-name -l "getsatisfaction.com/cloudcrowd/topics/")
    do
        perl -p -i -e 's/getsatisfaction\.com\/cloudcrowd\/topics/forum\.cloudcrowd\.com\/categories/g' $i
    done
}

GStoVFmain () {
    for i in $(git grep --full-name -l "getsatisfaction.com/cloudcrowd")
    do
        perl -p -i -e 's/getsatisfaction\.com\/cloudcrowd/forum\.cloudcrowd\.com/g' $i
    done
}
