# load-all.vim

Vim plugin that adds "Load All" option to the warning dialog when a file is changed outside Vim.

If files opened in Vim are changed outside of the editor, for example when you switch Git branches
or after a shell command, Vim will show a warning and ask to reload the file or keep the existing
version (warning [W11](https://neovim.io/doc/user/message.html#W11) or
[W12](https://neovim.io/doc/user/message.html#W12)). These warning errors will occur every time you
open any changed file and can be annoying when multiple files are changed.

This plugin adds a "Load All" option to reload all changed files and to prevent Vim from asking
again. The plugin works similar to the same dialog in MacVim.

The plugin wil also autoupdate file timestamps if the file contents are the same and only the mode
or timestamp was changed.

## License

[MIT](./LICENSE)
