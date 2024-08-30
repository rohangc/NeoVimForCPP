#!/bin/bash

# Clone vim-plug.vim
if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$LOCALAPPDATA}"

    # Create the directory if it doesn't exist
    mkdir -p "$XDG_DATA_HOME"

    # Clone the vim-plug into the required directory
    curl -fLo "$XDG_DATA_HOME"/nvim-data/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    INIT_VIM_DIR="$LOCALAPPDATA/nvim"
    mkdir -p $INIT_VIM_DIR

    mv -f ./init.nvim-win "$INIT_VIM_DIR/init.vim"
    rm -f ./init.nvim-lin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    # Create the directory if it doesn't exist
    mkdir -p "$XDG_DATA_HOME"

    # Clone the vim-plug into the required directory
    curl -fLo "$XDG_DATA_HOME"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    INIT_VIM_DIR="~/.config/nvim"
    mkdir -p $INIT_VIM_DIR

    mv -f ./init.nvim-lin "$INIT_VIM_DIR/init.vim"
    rm -f ./init.nvim-win
fi

mv -f ./nvim/* "$INIT_VIM_DIR/"
rm -rf ./nvim

# Delete self.
rm -f 'NvimConfigure.sh'
rm -f 'Readme.md'
