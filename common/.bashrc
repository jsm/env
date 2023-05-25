source ~/.env/.common.sh
source ~/.env/.system.sh
source ~/.env/.custom.sh
source ~/.private.sh
eval "$(direnv hook bash)"
if [ -f /Users/jonsanmiguel/co/backend/bin/taskrunner-completion.bash ]; then
  . /Users/jonsanmiguel/co/backend/bin/taskrunner-completion.bash
fi
