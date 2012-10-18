# This is a dotty config file that describes how to establish and install
# vim bundles using scripts/vim-update-bundles
#
# Copyright (C) 2011, Devin Weaver
# This work is part of my vimrc project at http://github.com/sukima/vimrc
# It is licensed under a Creative Commons Attribution 3.0 Unported License.

class DottyRepository < Thor
  include Thor::Actions

  desc "bootstrap", "Bootstrap VIM bundles"
  def bootstrap
    run "/bin/sh install.sh -I -v"
  end

  desc "implode", "Implode VIM bundles"
  def implode
    # TODO: Remove left over bundles?
  end
end
# vim:set sw=2 et ft=ruby:
