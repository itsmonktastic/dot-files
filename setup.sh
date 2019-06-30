#!/bin/sh
#
# First time setup, install programs needed/expected on Ubuntu.
#
# These obscure programs are useful because:
#
# clipit - used to sync different linux clipboards
# feh - used by mutt to show image attachments
# python-keyring - used to allow offlineimap access to a password
# w3m - used by mutt to display HTML emails

sudo apt-get -y install \
  git \
  vim \
  feh \
  offlineimap \
  clipit \
  mutt \
  python-keyring \
  w3m

# Install a plugin manager for vim (my vimrc expects it)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
$SCRIPTPATH/install.sh

# trigger installation of vim plugins the first time
vim -c PlugInstall
