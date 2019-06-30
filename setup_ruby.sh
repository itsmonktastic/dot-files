#!/bin/sh
#
# Set up everything needed to do rails dev on Ubuntu.

set -ex

# ruby-dev needed to build native extensions
# libxml2 needed to build nokogiri
sudo apt-get install -y ruby ruby-dev libxml2-dev 

# install some programs packaged in rubygems into home directory
GEM_INSTALL="gem install --user"

# most of my gemfiles are v1, v2 is unhappy with some of my projects right now
$GEM_INSTALL bundler -v 1.11
$GEM_INSTALL rails
