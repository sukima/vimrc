# This is a dotty config file that describes how to establish and install
# vim bundles using scripts/vim-update-bundles

class DottyRepository < Thor
  include Thor::Actions

  desc "bootstrap", "Bootstrap VIM bundles"
  def bootstrap
    run "sh install.sh -v"
  end

  desc "implode", "Implode VIM bundles"
  def implode
  end
end
# vim:set sw=2 et ft=ruby:
