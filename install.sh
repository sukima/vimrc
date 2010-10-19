#!/bin/bash

git submodule init
git submodule update
ruby scripts/vim-update-bundles/vim-update-bundles
