
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

tc () {
    b=$1;
    if git checkout $b; then
        : true;
    else
        git checkout -b $b;
        git push origin $b;
        git branch -u origin/$b;
    fi
}

gd () {
    b=$1
    git branch -r -d origin/$b
    git branch -D $b
    git push origin :$b
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
