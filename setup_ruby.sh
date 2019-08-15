#!/bin/sh
#
# Set up everything needed to do rails dev on Ubuntu.

set -e

YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# helper to prompt later
yes_or_no() {
  while true; do
    read -p "$* [y/n]: " yn
    case $yn in
      [Yy]*) return 0  ;;
      [Nn]*) return 1 ;;
    esac
  done
}

step() {
  printf $YELLOW
  printf ">> $*\n"
  printf $NC
}

# this file has configuration show gem will install into $HOME by default
step "Configuring gem install to install into home directory"
ln -sf dotgemrc $HOME/.gemrc

# ruby-dev needed to build native extensions
# build-essential because you need C++ toolchain to develop ruby
# libxml2-dev needed to build nokogiri
# libsqlite3-dev needed for ruby sqlite
# libv8-dev for mini_racer/therubyracer gems
step "Installing debian packages"
sudo apt-get install -y \
  ruby \
  ruby-dev \
  build-essential \
  libxml2-dev \
  libsqlite3-dev \
  libv8-dev

# install some programs packaged in rubygems into home directory
# assumption is that ~/.gem/ruby/*/bin is in $PATH
GEM_INSTALL="gem install --user"

# most of my gemfiles are v1, v2 is unhappy with some of my projects right now
step "Installing bundler/rails gems locally"
$GEM_INSTALL bundler -v '~>1.17'

# convenient to gem install rails, that way we can run the rails command without
# having a bundle when we want to create a new rails app
$GEM_INSTALL rails

# check if bundle path is set to user owned directory
# TODO should check permissions rather than checking for specific folder
GEM_USERDIR=$(ruby -e'puts Gem.user_dir')

step "Checking if bundle path set to user modifiable directory"
if [ "$BUNDLE_PATH" != "$GEM_USERDIR" ]; then
  DEFAULT_DIR=$(gem env gemdir)
  BUNDLE_OVERRIDE="BUNDLE_PATH=\$(ruby -e'puts Gem.user_dir')"

  printf $RED
  echo "By default 'bundle install' will try to install system wide to $DEFAULT_DIR"
  yes_or_no "Add line to .bashrc to configure bundle to default to user writable dir? ($GEM_USERDIR)"
  printf $NC

  if [ $? ]; then
    echo "# with this, a plain "bundle install" should use ~/.gem/ruby/x.x.x instead of system level" >> $HOME/.bashrc
    echo export $BUNDLE_OVERRIDE >> $HOME/.bashrc
  fi
fi
