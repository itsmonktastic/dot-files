#!/bin/sh
#
# Set up everything needed to do rails dev on Ubuntu.

set -ex

# this will configure gem to install into $HOME by default
ln -s dotgemrc $HOME/.gemrc

# ruby-dev needed to build native extensions
# build-essential because you need C++ toolchain to develop ruby
# libxml2-dev needed to build nokogiri
# libsqlite3-dev needed for ruby sqlite
# libv8-dev for mini_racer/therubyracer gems
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
$GEM_INSTALL bundler -v 1.11
$GEM_INSTALL rails
