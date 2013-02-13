# OCF config
if [ -r /opt/ocf/share/environment/.bashrc ]; then
  source /opt/ocf/share/environment/.bashrc
fi

if [ -r /opt/ocf/share/environment/.bash_profile ]; then
  source /opt/ocf/share/environment/.bash_profile
fi

alias e="emacs -nw"
