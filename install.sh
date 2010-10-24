#!/bin/bash

exit_code=0
which git > /dev/null
if [ $? -ne 0 ]; then
    echo "Git is not installed on this system."
    exit_code=1
fi
which ruby > /dev/null
if [ $? -ne 0 ]; then
    echo "Ruby is not installed on this system."
    exit_code=1
fi
if [ $exit_code -ne 0 ]; then
    exit $exit_code
fi

# install symlinks
# If we are on a system that does not support links then how is this bash
# script being executed?
echo "Checking symbolic links"
if [ -e $HOME/.vimrc ]; then
    if [ ! -h $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/vimrc.old
        echo "Saved old vimrc to $HOME/vimrc.old"
    fi
fi
if [ -e $HOME/.gvimrc ]; then
    if [ ! -h $HOME/.gvimrc ]; then
        mv $HOME/.gvimrc $HOME/gvimrc.old
        echo "Saved old gvimrc to $HOME/gvimrc.old"
    fi
fi


if [ ! -e $HOME/.vimrc ]; then
    ln -s $PWD/vimrc $HOME/.vimrc
fi
if [ ! -e $HOME/.gvimrc ]; then
    ln -s $PWD/gvimrc $HOME/.gvimrc
fi

git submodule init
git submodule update
ruby scripts/vim-update-bundles/vim-update-bundles

exit $exit_code
