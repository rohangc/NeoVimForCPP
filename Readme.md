# Usage Guide:

## Installation:

1. Install the latest version of Neovim (obviously!) and optionally, a GUI like 'Neovide'.

2. Install the following software and ensure that they binaries are accessible via your 'PATH' environment variable along with Neovim itself:
   * Git (should also automatically install Curl, if not install Curl manually).
   * Many plugins need Python to work. Install a 64-bit Python distribution, make it available through the PATH environment variable, and install the Python Neovim package by using command: "pip install neovim".

3. Clone/copy the files of this repo into any directory of your choice.

4. Invoke a "Git Shell" ("Git Bash" on Windows) and do the following:
   * Navigate to the directory where the cloned files are located.
   * Execute the script: 'NvimConfigure.sh'.
   * Invoke Neovim - ignore any error messages.
   * In Neovim, simply enter this command to install all necessary plugins: ":PlugInstall".
   * Close Neovim.

5. Restart Neovim - you shouldn't see any error messages this time around.

6. Now, for the magical part!:
   * Open any source code file in Neovim.
   * Execute command: ":LspInstall" - this magically installs the Language Server required for the type of file open!

7. Execute command ':checkhealth'.
   * This shows you a list of missing/broken/incompatible dependencies (other programs) that need to be resolved for Neovim to work.
   * Resolve those issues.

## Extras and Useful Links:
### Clang/Clangd:

1. Clangd C++ Language Server: install and configure Cmake to generate a compilation database ('compile_commands.json') of your C++ project (see: https://github.com/ycm-core/YouCompleteMe#c-family-semantic-completion). The Clangd Language Server for C++ won't work if 'compile_commands.json' isn't found in your project directory.
2. If you are unable to use Cmake for generating 'compile_commands.json', you may need to install and configure your build system to use a utility such as 'compiledb' or 'Bear' to create the compilation database.
3. Optional step: copy '.clang-tidy' (after modifying it to your heart's content) into the 'root' directory that holds all your projects.
4. Clangd documentation: https://clangd.llvm.org/installation
5. Force CMake to build your project using all available cores on your system: https://blog.kitware.com/cmake-building-with-all-your-cores
6. Use Clang (instead of MSVC) to build projects in Visual Studio: https://docs.microsoft.com/en-us/cpp/build/clang-support-msbuild
