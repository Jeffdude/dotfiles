syntax on
filetype on
"for loading plugins
"execute pathogen#infect()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc()


if has("mouse")
    set mouse=a
endif

set noundofile
set nobackup
set nowritebackup
set noswapfile
set smartindent
set number
set t_Co=256
set background=dark
set nocompatible
set showcmd
set laststatus=2
set nohlsearch
highlight LineNr ctermfg=DarkBlue
highlight LineNr guifg=DarkBlue
set ignorecase
set incsearch
set ruler
set showmatch
"set scrolloff=5
"set scrolljump=-10
set wildmenu
set wildmode=list:longest,full
"tabs be gone!
set expandtab
set shiftwidth=4
set tabstop=4
"do not expand tab for Makefiles
autocmd FileType make set noexpandtab
"html tabstop is smaller
autocmd Filetype html setlocal tabstop=2|set shiftwidth=2
autocmd Filetype html set nolinebreak 
autocmd Filetype htmldjango setlocal tabstop=2|set shiftwidth=2
autocmd Filetype htmldjango set tw=0 | set wm=0 
"markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown set tw=0 |set wm=0 |set nolinebreak
autocmd Filetype markdown setlocal tabstop=2|set shiftwidth=2
"treat wrapped lines as many lines when scrolling
map j gj
map k gk
"general relativity
set relativenumber
" gui options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
"colorscheme codeschool

"make it prettier
hi Visual cterm=none ctermbg=Black ctermfg=White
hi Visual gui=none guibg=Black guifg=White
"hi Search cterm=NONE ctermfg=white ctermbg=Black

"make vim figure it out...
command W w
command Q q
command WQ wq
command M make

Plugin 'tpope/vim-obsession'

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
let g:airline_powerlineish = 1
Plugin 'tpope/vim-surround'

Plugin 'dense-analysis/ale'

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

" let mapleader = ","
 let mapleader = "\<Space>"

" Fast saving
nmap <leader>s :w!<cr>

nmap <C-w>" :sp<cr>
nmap <C-w>% :vs<cr>

" Fast buffer switching
nmap <leader>bb :b#<cr>

" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

map <leader>pp :set invpaste<cr>
map <leader>fl :call FillLine( ' ' )<cr>

map <leader>t :tabnew %<cr>
map <leader>k :tabn<cr>
map <leader>K :tabm +1<cr>
map <leader>j :tabp<cr>
map <leader>J :tabm -1<cr>

map <leader>c gg"*yG``

Plugin 'vim-syntastic/syntastic'

" Pressing ,ss will toggle and untoggle spell checking
set spelllang=en_us
map <leader>ss :setlocal spell!<cr>

command Vs vs

"80 character line break
set linebreak
set textwidth=80
set formatoptions+=t

set runtimepath^=~/.vim/bundle/ctrlp.vim
let ctrlp_map = '<c-p>'
let ctrlp_cmd = 'CtrlP'
call vundle#end()
filetype plugin indent on

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

map <leader>l :Shell eslint .<cr>
