# Give Up GitHub

This project has given up GitHub.  ([See Software Freedom Conservancy's *Give
Up  GitHub* site for details](https://GiveUpGitHub.org).)

You can now find this project at [SourceHut](https://git.sr.ht/~sukima/vimrc)
instead.

Any use of this project's code by GitHub Copilot, past or present, is done
without our permission.  We do not consent to GitHub's use of this project's
code in Copilot.

Join us; you can [give up GitHub](https://GiveUpGitHub.org) too!

![Logo of the GiveUpGitHub campaign](https://sfconservancy.org/img/GiveUpGitHub.png)

# vimrc

This is my personal VIM configuration repository.

Copyright (C) 2011-2023 By Devin Weaver suki (at) tritarget.org

## Features

This seamlessly uses either [Vundle][1] or [Pathogen][2] to manage plugins (or
bundles) It is also compataible with [vim-update-bundles][3].

The files are [dotty][4] compatible but there is also an easy install.sh script
(see below).

[1]: http://github.com/gmarik/vundle
[2]: http://www.vim.org/scripts/script.php?script_id=2332
[3]: https://github.com/bronson/vim-update-bundles
[4]: https://github.com/trym/dotty

## Layout

#### scripts/

A directory of helper and misclanious scripts that are not part of VIM or the
VIM config files. (Not needed for a simple vimrc install).

#### dotty-repository.thor

Runs `install.sh` after dotty bootstrap.

#### dotty-symlinks.yml

Tells Dotty how to symlink the following files / directories.

#### vimrc / gvimrc

The main `.vimrc` and `.gvimrc.` They are linked to `~/.vimrc` and `~/.gvimrc`
(`_vimrc` and `_gvimrc` on windows)

#### vimfiles/

All the custom config scripts. Links to `~/.vim`

#### install.sh

A shell script to manually make the symlinks and also download a plugin
manager.

    Usage: install.sh [-M][-I][-f][-w][-p][-v][-b] [-d prefix]
      -M,--no-managers          Do not download and install plugin managers
      -I,--no-install           Do not install .vimrc, .gvimrc and .vim
      -w,--windows              Use windows paths (_vimrc, _gvimrc, vimfiles)
      -f,--force                Force overwriting vimrc, gvimrc, etc. ** DESTRUCTIVE **
      -p,--pathogen             Install pathogen package
      -b,--vim-upadate-bundles  Install vim-update-bundles package
      -v,--vundle               Install vundle package even if -p was used
      -h,--help                 This cruft
      -d,--dir prefix           Install to prefix instead of default $HOME/.vim
    Cannot concatinate arguments (-IM will not work, use -I -M instead).

## Installation / usage

Instalation is handled either via a dotfile management system (like [Dotty][4])
or manually via the `install.sh` file.

Once the symlinks (or copied files) are in place all bundles can be installed
with a plugin manager such as [Vundle][1] or [vim-update-bundles][3] (which
will download and install the bundles listed in `vimrc`.

[Vundle][1] will automatically load the bundles into vim when it starts.
However [vim-update-bundles][3] will need [Pathogen][2] to load the bundles.

the `vimrc` will automatically use the above managers if found or ignore them
if not.

### Requirements

#### Vundle
* git (the git executable must be in your $PATH)

#### vim-update-bundles
* ruby (tested on 1.9.2) and rubygems
* git (the git executable must be in your $PATH)

#### install.sh
* Either git or curl in your $PATH

## License

This work is licensed under a [Creative Commons Attribution 3.0 Unported License.][5]

With the express exception of the `install.sh` file which is licensed under the
[GNU General Public License V3.0 or later.][6]

[5]: http://creativecommons.org/licenses/by/3.0/
[6]: http://www.gnu.org/licenses/gpl.html
