set expandtab
set tabstop=2
set shiftwidth=2

let b:ale_fixers = ['eslint']
"let b:ale_linters = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_eslint_options='-c $(cygpath ~/.eslintrc.js)'
"let g:ale_javascript_prettier_use_global = 1
