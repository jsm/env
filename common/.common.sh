CLICOLOR=1
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR=emacs

export PATH=~/.env/bin:$PATH

if [ -f ~/.env/git-completion.bash ]; then
    source ~/.env/git-completion.bash
fi

source ~/.bash_aliases
source ~/.bash_functions
