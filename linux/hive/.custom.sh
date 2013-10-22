alias e="emacs -nw"

function _update_ps1() {
    export PS1="$(~/.powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"

export PATH=/share/b/grading/bin:$PATH

[[ -z ${MASTER} ]] && export MASTER=${LOGNAME%-*}
[[ -z ${MASTERDIR} ]] && export MASTERDIR=$(eval echo ~${MASTER})

[[ -e ${MASTERDIR}/adm/class.bash_profile ]] && . ${MASTERDIR}/adm/class.bash_profile

export PATH=~/.env/bin:$PATH