#!/bin/sh

echo "copy dot files"
cp -fv .vimrc ~
cp -fv .tmux.conf ~
cp -fv .bashrc ~
cp -fv .gitconfig ~

echo "config vimrc"
echo "clone vundle.vim ..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null
echo "install vundle plugin ..."
vim +PluginInstall +qa

echo "ok~"
