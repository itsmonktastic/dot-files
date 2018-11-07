#!/bin/sh

set -e

SCRIPT=$(readlink -f $0)
DOTFILES_DIR=$(dirname $SCRIPT)

ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/.Xdefaults $HOME/.Xdefaults
