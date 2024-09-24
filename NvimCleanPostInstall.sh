#!/bin/bash

# Clone vim-plug.vim
if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$LOCALAPPDATA}"

    INIT_VIM_DIR="$LOCALAPPDATA/nvim"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Check if XDG_DATA_HOME is set; use default path if not
    XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

    INIT_VIM_DIR="~/.config/nvim"
fi

# Remove files that are no longer required
rm -rf $INIT_VIM_DIR/lua
rm -f $INIT_VIM_DIR/.gitignore
rm -f $INIT_VIM_DIR/.neoconf.json
rm -f $INIT_VIM_DIR/lazy-lock.json
rm -f $INIT_VIM_DIR/LICENSE
rm -f $INIT_VIM_DIR/README.md
rm -f $INIT_VIM_DIR/stylua.toml

# Clean self
rm -f ./NvimCleanPostInstall.sh
