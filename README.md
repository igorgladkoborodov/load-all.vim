# load-all.vim

Vim plugin that adds "Load All" option to the warning dialog when file was changed outside.

If opened files were changed outside of Vim, for example when you switch Git branches or after
shell command, it shows warning and ask to reload file or keep existing version (warning
[W11](https://neovim.io/doc/user/message.html#W11) or [W12](https://neovim.io/doc/user/message.html#W12)).

It can be annoying when multiple files changed, and you will see this error every time you open
any of them.

This plugin adds "Load All" option to reload all changed files and don't ask it again. Works
similar to the same dialog in MacVim.

It will also autoupdate files timestamps if only mode or timestamp changed, and file content is the
same.

## TODO

- [ ] Ignore all option
- [ ] Localization
- [ ] Make it look nicer than default confirm dialog?
