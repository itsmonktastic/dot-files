#!/bin/sh

set -e

SCRIPT=$(readlink -f $0)
DOTFILES_DIR=$(dirname $SCRIPT)

mkdir -p $HOME/.config/i3/
mkdir -p $HOME/.config/clipit/
mkdir -p $HOME/.urxvt/ext
mkdir -p $HOME/.mutt

ln -is $DOTFILES_DIR/.vimrc $HOME/.vimrc
ln -is $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
ln -is $DOTFILES_DIR/i3_config $HOME/.config/i3/config
ln -is $DOTFILES_DIR/clipitrc $HOME/.config/clipit/clipitrc
ln -is $DOTFILES_DIR/i3status_conf $HOME/.i3status.conf
ln -is $DOTFILES_DIR/urxvt-extensions/font-size $HOME/.urxvt/ext/font-size
ln -is $DOTFILES_DIR/offlineimap_config $HOME/.offlineimaprc
ln -is $DOTFILES_DIR/muttrc $HOME/.muttrc
ln -is $DOTFILES_DIR/mutt_mailcap $HOME/.mutt/mailcap
ln -is $DOTFILESDIR/bash_aliases $HOME/.bash_aliases
