set nocompatible
filetype plugin indent on
runtime macros/matchit.vim
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*.swp
set backspace=indent,eol,start
set shortmess=atI
set visualbell
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

:nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set tabstop=2 shiftwidth=2 expandtab

set ttimeoutlen=50

autocmd BufEnter *.haml setlocal cursorcolumn
autocmd BufEnter *.sass setlocal cursorcolumn

silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

syntax on
set ruler
set showmatch
set mat=5
set cursorline
set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+
set list

if has('gui_running')
	set guioptions-=T
	set guioptions-=m
	set mousehide
endif

set number
set numberwidth=5

color blackboard

set hlsearch
set incsearch

nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
vnoremap ∆ :m'>+<CR>gv=gv
vnoremap ˚ :m-2<CR>gv=gv

au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead *.j set filetype=objc
