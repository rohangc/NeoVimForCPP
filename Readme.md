Usage guide:
-----------

Installation:
------------

    1. Install NeoVim (... obviously!) and a GUI like 'Neovide'.

    2. Install the following software and ensure that Vim and all these binaries are accessible via your 'PATH' environment variable:
        a. Git (should also automatically install Curl)
        b. Python - the same architecture as that of your Vim (x86/x64)
           If you are prevented from installing Python on your system due to any reason:
                1. Extract the Python distributable binaries into the same directory where the Vim binaries lie.
                2. Temporarily add a path to this directory while compiling 'YouCompleteMe'.
        c. Very important:
            1. Install pip if not already installed (the exact method to do this is available online).
            2. Python neowim module: from any console, enter: "pip install neovim".
        d. ctags
        e. Microsoft Visual C++ to build 'YouCompleteMe'. The Express edition will suffice.
        f. Node.js (for the Github Copilot plugin)
        g. cmake
                1. As mentioned in the YouCompleteMe manual, if you don't use cmake, you may need to install and configure your build system to use a utility such as 'compiledb' or 'Bear' to create compilation databases.

    3. Copy only the following files from this repository into your 'HOME' directory (on Windows, this is usually 'C:\Users\<your login name>').
        a. Directory: 'nvim' and all its subdirectories.
        b. 'init.nvim-lin'.
        c. 'init.nvim-win'
        d. 'GvimConfigure.sh'
    
    4. Invoke a "Git Shell" ("Git Bash" on Windows) and do the following:
        a. Navigate to your 'HOME' directory.
        b. Execute the script 'NvimConfigure.sh'.
        c. If the above script fails to install plugins, do so manually:

    5. Build 'YouCompleteMe' according to instructions on its website: http://valloric.github.io/YouCompleteMe.
        a. In brief, on Windows:
            1. Open a Visual Studio "x64 Native tools Command Prompt".
            2. Navigate to directory: %HOME%\.vim\bundle\YouCompleteMe.
            3. Execute: "python ./install.py --clangd-completer".
                a. Invoke NeoVim.
                b. Execute: ":PluginInstall".

    6. Copy '.clang-tidy' (after modifying to your heart's content) into the 'root' directory that holds all your projects.

    7. Restart NeoVim.

Update:
------

    1. Command line: Invoke a "Git Shell" and execute the following commands:        
        b. "neovim +PluginUpdate +qall".

    2. From within NeoVim: ":PluginUpdate".


Some useful links:
-----------------
C++:
---

1. YouCompleteMe C family documentation: https://github.com/ycm-core/YouCompleteMe#c-family-semantic-completion
2. Configure CMake (required by YouCompleteMe) to generate a compilation database: https://github.com/ycm-core/YouCompleteMe#c-family-semantic-completion
3. Force CMake to build your project using all available cores on your system: https://blog.kitware.com/cmake-building-with-all-your-cores
4. Use Clang (instead of MSVC) to build projects in Visual Studio: https://docs.microsoft.com/en-us/cpp/build/clang-support-msbuild
5. Clangd documentation: https://clangd.llvm.org/installation

Python:
------

1. YouCompleteMe Python documentation: https://github.com/ycm-core/YouCompleteMe#python-semantic-completion
2. Python semantic code completion support is through the JEDI engine: https://github.com/davidhalter/jedi
