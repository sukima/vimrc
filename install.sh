#!/bin/sh
# Copyright (C) 2011, Devin Weaver
# This file is part of my vimrc project at http://github.com/sukima/vimrc
#
# install.sh is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# install.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/> for more information.


display_usage() {
    echo >&2 "Usage: install.sh [-M][-I][-f][-w][-p][-v][-b] [-d prefix]"
}

display_help() {
    display_usage
    echo >&2 "  -M,--no-managers          Do not download and install plugin managers"
    echo >&2 "  -I,--no-install           Do not install .vimrc, .gvimrc and .vim"
    echo >&2 "  -w,--windows              Use windows paths (_vimrc, _gvimrc, vimfiles)"
    echo >&2 "  -f,--force                Force overwriting vimrc, gvimrc, etc. ** DESTRUCTIVE **"
    echo >&2 "  -p,--pathogen             Install pathogen package"
    echo >&2 "  -b,--vim-upadate-bundles  Install vim-update-bundles package"
    echo >&2 "  -v,--vundle               Install vundle package even if -p was used"
    echo >&2 "  -h,--help                 This cruft"
    echo >&2 "  -d,--dir prefix           Install to prefix instead of default \$HOME/.vim"
    echo >&2 "Cannot concatinate arguments (-IM will not work, use -I -M instead)."
}

install_package() {
    package=$1; url=$2; loc=$3
    test -n "$loc" || loc="${PREFIX}/bundle/${package}"
    test -d "$loc" || mkdir -p "$loc"
    echo "$url" | grep -q "://" || url="https://github.com/${url}.git"
    echo "Using $PROG to fetch plugin manager $package to $loc."
    if test "$PROG" = "git"; then
        if test -d "$loc/.git"; then
            echo "Git repository found, updateing..."
            cd "$loc" >&-
            git pull
            cd - >&-
        else
            echo "Repository: $url"
            git clone --depth 1 "$url" "$loc"
        fi
    else
        if ls -A "$loc" >&-; then
            echo >&2 "Existing $package install found. Skipping."
        else
            cd "$loc" >&-
            tarurl=`echo "$url" | sed -e s+\.git$+/tarball/master+`
            echo "Attempting to download $tarurl"
            curl -L "$tarurl" | tar zx --strip-components 1
            cd - >&-
        fi
    fi
}


FORCE=no
WIN=no
VUNDLE_ARG=no
PATHOGEN_ARG=no
UPDATE_BUNDLES=no
NO_INSTALL_ARG=no
NO_MANAGER_ARG=no
DIR=`dirname $0`
PREFIX="$HOME/.vim"

while test -n "$1"; do
    case "$1" in
        -M|--no-managers) NO_MANAGER_ARG="yes" ;;
        -I|--no-install) NO_INSTALL_ARG="yes" ;;
        -f|--force) FORCE="yes" ;;
        -w|--windows) WIN="yes" ;;
        -v|--vundle) VUNDLE_ARG="yes" ;;
        -b|--vim-update-bundles) UPDATE_BUNDLES="yes" ;;
        -p|--pathogen) PATHOGEN_ARG="yes" ;;
        -d|--prefix)
            test -n "$2" || { display_usage; exit 128; }
            PREFIX=$2;
            shift
            ;;
        -h|--help) display_help; exit 128 ;;
        *) display_usage; exit 128 ;;
    esac
    shift
done


if test "$NO_INSTALL_ARG" = "yes"; then
    echo "Skipping vimrc et al install."
else
    if test "$WIN" = "no"; then
        if test "$FORCE" = "yes"; then
            test -e "$HOME/.vimrc" && { rm -f "$HOME/.vimrc"; echo "$HOME/.vimrc DESTROYED!"; }
            test -e "$HOME/.gvimrc" && { rm -f "$HOME/.gvimrc"; echo "$HOME/.gvimrc DESTROYED!"; }
            test -e "$HOME/.vim" && { rm -rf "$HOME/.vim"; echo "$HOME/.vim DESTROYED!"; }
        fi
        if test -e "$HOME/.vimrc"; then
            echo "$HOME/.vimrc exists. Skipping. (Using -f will destroy it!)"
        else
            ln -s "$DIR/vimrc" "$HOME/.vimrc"
        fi
        if test -e "$HOME/.gvimrc"; then
            echo "$HOME/.gvimrc exists. Skipping. (Using -f will destroy it!)"
        else
            ln -s "$DIR/gvimrc" "$HOME/.gvimrc"
        fi
        if test -e "$HOME/.vim"; then
            echo "$HOME/.vim exists. Skipping. (Using -f will destroy it!)"
        else
            ln -s "$DIR/dotfiles/in+.vim" "$HOME/.vim"
        fi
    else
        cd "$DIR"
        if test "$FORCE" = "yes"; then
            test -e ../_vimrc && { rm -f ../_vimrc; echo "../_vimrc DESTROYED!"; }
            test -e ../_gvimrc && { rm -f ../_gvimrc; echo "../_gvimrc DESTROYED!"; }
            test -e ../vimfiles && { rm -rf ../vimfiles; echo "../vimfiles DESTROYED!"; }
        fi
        if test -e ../_vimrc; then
            echo "../_vimrc exists. Skipping. (Using -f will destroy it!)"
        else
            cp "$DIR/vimrc" ../_vimrc
        fi
        if test -e ../_gvimrc; then
            echo "../_gvimrc exists. Skipping. (Using -f will destroy it!)"
        else
            cp "$DIR/gvimrc" ../_gvimrc
        fi
        if test -e ../vimfiles; then
            echo "../vimfiles exists. Skipping. (Using -f will destroy it!)"
        else
            cp -R "$DIR/dotfiles/in+.vim" ../vimfiles
        fi
    fi
fi


if test "$NO_MANAGER_ARG" = "yes"; then
    echo "Skipping plugin management install."
else
    test -d "$PREFIX" || { echo >&2 "$PREFIX does not exists yet. Have you tried usinf the -i option?"; exit -1; }
    if hash git 2>&-; then
        PROG=git
        VUNDLE="yes"
        PATHOGEN="no"
    elif hash curl 2>&-; then
        PROG=curl
        VUNDLE="no"
        PATHOGEN="yes"
        hash tar 2>&- || { echo >&2 "curl downloads a tar file. However, I was unable to find tar in your PATH. Aborting."; exit 1; }
        test "$VUNDLE_ARG" = "yes" && echo >&2 "Vundle requires git which is not found in your PATH. Use at your own risk!"
    else
        echo >&2 "I require git or curl but was unable to find either in your PATH. Aborting."
        exit 1
    fi

    test "$PATHOGEN_ARG" = "yes" && PATHOGEN="yes"
    test "$VUNDLE_ARG" = "yes" && VUNDLE="yes"

    test "$VUNDLE" = "yes" && install_package "vundle" "gmarik/vundle"
    test "$PATHOGEN" = "yes" && install_package "pathogen" "tpope/vim-pathogen"
    test "$UPDATE_BUNDLES" = "yes" && install_package "vim-update-bundles" "bronson/vim-update-bundles" "scripts/vim-update-bundles"
fi
