gr() {
  if GIT_ROOT=$(git rev-parse --show-toplevel); then
    cd $GIT_ROOT
  fi
}

search() {
  find . -name \*$1\*
}

delete_all() {
  find . -type f -name $1 -o -type l -name $1 -exec rm -f {} \;
}
alias remove_all="delete_all"

newrepo() {
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin git@github.com:sanmiguelje/$1.git
  git push -u origin master
}

sym() {
  mv $1 $2
  ln -s $2$1
}

indentallrb() {
  find . -iname \*.rb -exec emacs -nw {} --eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" --kill \;
}

prunelocal() {
  git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

test_connection() {
  nc -v -w 1 $1 -z $2
}

gpgencrypt() {
  gpg --output $1.gpg --encrypt --recipient $2 $1
}

ecrlogin() {
  $(aws ecr get-login --no-include-email)
}

githubapi() {
  curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com$1
}

randomsre() {
  array[0]="charleen"
  array[1]="tom"
  array[2]="xuan"
  array[3]="eliot"

  size=${#array[@]}
  index=$(($RANDOM % $size))
  echo ${array[$index]}
}