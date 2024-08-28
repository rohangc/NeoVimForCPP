#!/bin/bash

# Clone Vundle.vim
if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    git clone --recursive https://github.com/VundleVim/Vundle.vim ~/nvim/bundle/Vundle.vim
    mkdir ~/AppData/Local/nvim
    mv -f ./init.nvim-win ~/AppData/Local/nvim/init.vim
    rm -f ./init.nvim-lin
    mv -f ./nvim/* ~/AppData/Local/nvim/
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    git clone --recursive https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
    mkdir ~/.config/nvim
    mv -f ./init.nvim-lin ~/.config/nvim/init.vim
    rm -f ./init.nvim-win
    mv -f ./nvim/* ~/.config/nvim/
fi

rm -rf ./nvim

# Delete self.
rm -f 'NvimConfigure.sh'
rm -f 'Readme.md'

# Use Gvim to install GVim plugins using Vundle.vim
nvim +PluginInstall +qall
