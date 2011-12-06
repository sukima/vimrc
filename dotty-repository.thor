# This is a dotty config file that describes how to establish and install
# vim bundles using scripts/vim-update-bundles

class DottyRepository < Thor
  include Thor::Actions

  desc "bootstrap", "Bootstrap VIM bundles"
  def bootstrap
    run "sh install.sh -I -v"
  end

  desc "implode", "Implode VIM bundles"
  def implode
    # TODO: Remove left over bundles?
  end
end
# vim:set sw=2 et ft=ruby:
