#!/bin/sh
#
# Set up everything needed to do clojure dev on ubuntu

set -ex

# install emacs
sudo apt-get install -y emacs
cp -r dotemacs $HOME/.emacs.d

# install leiningen
mkdir -p $HOME/bin
if [ ! -f $HOME/bin/lein ]
then
  curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $HOME/bin/lein
fi
chmod a+x $HOME/bin/lein

# this script downloads lein.jar
$HOME/lein 2>/dev/null
