# load-all.vim

A Vim plugin that adds a "Load All" option to the warning dialog displayed when a file is changed
outside of Vim.

If files opened in Vim are changed externally, for instance, when switching Git branches or
following the execution of a shell command, Vim will display a warning. This warning prompts the
user to either reload the file or keep the current version (triggered by warning codes
[W11](https://neovim.io/doc/user/message.html#W11) or
[W12](https://neovim.io/doc/user/message.html#W12)). These warnings are presented every time any
changed file is opened, which can be cumbersome when multiple files have been modified.

This plugin introduces a "Load All" option to the warning dialog, allowing for the reloading of all
changed files at once and preventing Vim from issuing repeated prompts. The functionality of this
plugin is similar to the corresponding dialog in MacVim.

Additionally, the plugin will automatically update file timestamps if the content remains unchanged
and only the file's mode or timestamp has been altered.

## License

[MIT](./LICENSE)
