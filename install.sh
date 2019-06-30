#!/bin/sh

set -e

SCRIPT=$(readlink -f $0)
DOTFILES_DIR=$(dirname $SCRIPT)

mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/clipit/
mkdir -p $HOME/.urxvt/ext
mkdir -p $HOME/.mutt

ln -fs $DOTFILES_DIR/.vimrc $HOME/.vimrc
ln -fs $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
ln -fs $DOTFILES_DIR/i3_config $HOME/.config/i3/config
ln -fs $DOTFILES_DIR/clipitrc $HOME/.config/clipit/clipitrc
ln -fs $DOTFILES_DIR/i3status_conf $HOME/.i3status.conf
ln -fs $DOTFILES_DIR/urxvt-extensions/font-size $HOME/.urxvt/ext/font-size
ln -fs $DOTFILES_DIR/offlineimap_config $HOME/.offlineimaprc
ln -fs $DOTFILES_DIR/muttrc $HOME/.muttrc
ln -fs $DOTFILES_DIR/mutt_mailcap $HOME/.mutt/mailcap
ln -fs $DOTFILES_DIR/bash_aliases $HOME/.bash_aliases
ln -fs $DOTFILES_DIR/dotbashrc $HOME/.bashrc

git config --global user.email "t.r.monks@gmail.com"
git config --global user.name "Tim Monks"
