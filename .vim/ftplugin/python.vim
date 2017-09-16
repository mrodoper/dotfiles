syntax on
filetype indent plugin on
set modeline
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=120
setlocal colorcolumn=120
setlocal smarttab
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

let python_highlight_all=1


let g:syntastic_python_checkers=['flake8', 'pylint']

" disable 80 char line width limit check for py files for flake8
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" python autocompletion shortcuts
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>s  :YcmCompleter GoToReferences<CR>
map <leader>o  <C-o>
map <leader>i  <C-i>
