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
set scrolloff=5
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

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
let g:airline_theme='murmur'
Plugin 'tpope/vim-surround'
Plugin 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

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
" let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Pressing ,ss will toggle and untoggle spell checking
set spelllang=en_us
map <leader>ss :setlocal spell!<cr>

"80 character line break
set linebreak
set textwidth=80
set formatoptions+=t

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
call vundle#end()
filetype plugin indent on
