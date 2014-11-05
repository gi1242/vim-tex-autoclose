# tex_autoclose.vim

Provides mappings to automatically close environments in TeX/LaTeX.

Pressing `\c` in normal mode (or `<C-\>c` in insert mode) will cause the last open environment to be closed.
(If a fold is started on the `\begin{env}` line, then it will be automatically
closed on the `\end{env}` line.)

Also pressing `<C-\>}` in insert mode when the cursor is at the end of a `\begin{environment}` will automatically generate a `\end{environment}`.
It will leave the cursor at the end of the `\begin{environment}` (in insert mode), so that the user can enter arguments [if any].

Small and functional. Suggestions welcome.
 
## Install details

Drop the script into your `$VIMRUNTIME/ftplugin` directory for global instalation.
Put it in `~/.vim/ftplugin` for local installation.

## Links

* [Vim script page](http://www.vim.org/scripts/script.php?script_id=920)

* [Git hub page](https://github.com/gi1242/vim-tex-autoclose)
