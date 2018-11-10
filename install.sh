#!/bin/sh

set -e

SCRIPT=$(readlink -f $0)
DOTFILES_DIR=$(dirname $SCRIPT)

mkdir -p $HOME/.config/i3/

ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
ln -s $DOTFILES_DIR/i3_config $HOME/.config/i3/config

