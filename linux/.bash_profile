
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

[[ -z ${MASTER} ]] && export MASTER=${LOGNAME%-*}
[[ -z ${MASTERDIR} ]] && export MASTERDIR=$(eval echo ~${MASTER})

[[ -e ${MASTERDIR}/adm/class.bash_profile ]] && . ${MASTERDIR}/adm/class.bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
