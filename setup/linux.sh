rm ~/env
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.emacs
rm -rf ~/.emacs.d
ln -s $1 ~/env
ln -s ~/env/.bash_profile ~/.bash_profile
ln -s ~/env/.bashrc ~/.bashrc
ln -s ~/env/.gitconfig ~/.gitconfig
ln -s ~/env/.emacs ~/.emacs
ln -s ~/env/.emacs.d ~/.emacs.d
