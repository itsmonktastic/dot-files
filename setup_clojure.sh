#!/bin/sh
#
# Set up everything needed to do clojure dev on ubuntu

set -ex

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/bin/lein
chmod a+x ~/bin/lein

cp dotemacs ~/.emacs.d
