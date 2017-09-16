syntax on
filetype indent plugin on
set modeline
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal colorcolumn=80
setlocal smarttab
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
