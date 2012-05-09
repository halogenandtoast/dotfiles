" Vundle Setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'greplace.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-surround.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'othree/html5.vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tComment'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar.git'
Bundle 'godlygeek/tabular.git'
Bundle 'Lokaltog/vim-powerline.git'

filetype plugin indent on

" Syntax
syntax enable

" Tell vim to shut up
set visualbell

" Status bar
set laststatus=2

" Tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Line numbers
set number
set numberwidth=5

" Color Scheme
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized
call togglebg#map("<F6>")

" Search Options
set hlsearch
set incsearch

" Splits
set splitbelow
set splitright

" Grep
set grepprg=ack

" Trailing Whitespace
set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+
set list
nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Cursor
set cursorline

" Matching
runtime macros/matchit.vim
set showmatch
set mat=5
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" File messages and options
set shortmess=atI
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*.swp


" Gvim options
if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=t

  set mousehide
  set guifont=Monaco:h22
endif
nnoremap <silent> <F13> :TagbarToggle<CR>
