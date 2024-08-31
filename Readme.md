# Usage Guide:

## Installation:

1. Install NeoVim (... obviously!) and a GUI like 'NeoVide'.

2. Install the following software and ensure that NeoVim and all these binaries are accessible via your 'PATH' environment variable:
   * Git (should also automatically install Curl).
   * Cmake - for LSP to work with Clangd, if you don't use cmake, you may need to install and configure your build system to use a utility such as 'compiledb' or 'Bear' to create the compilation databases: 'compile_commands.json' for your project.
   * Ctags.
   * Node.js (for the Github Copilot plugin).

4. Clone/copy the files into any directory of your choice.

5. Invoke a "Git Shell" ("Git Bash" on Windows) and do the following:
   * Navigate to the directory where the cloned files are located.
   * Execute the script 'NvimConfigure.sh'.
   * Invoke NeoVim - ignore any error messages.
   * Execute the commands to install Plug-ins: ":PlugInstall".
   * Close NeoVim.

7. Copy '.clang-tidy' (after modifying to your heart's content) into the 'root' directory that holds all your projects.

8. Restart NeoVim.

9. Now, for the magical part:
   * Open any source code file in NeoVim.
   * Execute command: ":LspInstall" - this magically installs the language server required for the type of file open!!

## Some useful links:
### C++:

1. Configure CMake (required by language servers) to generate a compilation database: https://github.com/ycm-core/YouCompleteMe#c-family-semantic-completion
2. Force CMake to build your project using all available cores on your system: https://blog.kitware.com/cmake-building-with-all-your-cores
3. Use Clang (instead of MSVC) to build projects in Visual Studio: https://docs.microsoft.com/en-us/cpp/build/clang-support-msbuild
4. Clangd documentation: https://clangd.llvm.org/installation

### Python:

1. Python semantic code completion support is through the JEDI engine: https://github.com/davidhalter/jedi
