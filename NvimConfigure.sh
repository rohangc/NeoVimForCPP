#!/bin/bash

# Clone vim-plug.vim
if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$LOCALAPPDATA}"

    # Create the directory if it doesn't exist
    mkdir -p "$XDG_DATA_HOME"

    INIT_VIM_DIR="$LOCALAPPDATA/nvim"
    mkdir -p $INIT_VIM_DIR

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    # Create the directory if it doesn't exist
    mkdir -p "$XDG_DATA_HOME"

    INIT_VIM_DIR="~/.config/nvim"
    mkdir -p $INIT_VIM_DIR
fi

# Clone the Lazy.nvim
git clone https://github.com/LazyVim/starter $INIT_VIM_DIR

# Remove the .git directory
rm -rf $INIT_VIM_DIR/.git

mv -f ./init.lua "$INIT_VIM_DIR/init.lua"

mv -f ./nvim/* "$INIT_VIM_DIR/"
rm -rf ./nvim

# Delete self.
rm -f 'NvimConfigure.sh'
rm -f 'Readme.md'
