
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

[[ -z ${MASTER} ]] && export MASTER=${LOGNAME%-*}
[[ -z ${MASTERDIR} ]] && export MASTERDIR=$(eval echo ~${MASTER})

[[ -e ${MASTERDIR}/adm/class.bash_profile ]] && . ${MASTERDIR}/adm/class.bash_profile