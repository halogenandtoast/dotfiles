set nocompatible
filetype plugin indent on
runtime macros/matchit.vim
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*.swp
" set backspace=indent,eol,start
set backspace=
set shortmess=atI
set visualbell
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

:nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

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
  set guioptions-=r
  set guioptions-=L
  set guioptions-=t

	set mousehide
  set guifont=Monaco:h16
endif

set number
set numberwidth=5

color molokai

set hlsearch
set incsearch

set splitbelow
set splitright

set grepprg=ack

nnoremap <M-j> :m+<CR>==
nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
vnoremap ∆ :m'>+<CR>gv=gv
vnoremap ˚ :m-2<CR>gv=gv

au BufNewFile,BufRead Gemfile,*.ru set filetype=ruby
au BufNewFile,BufRead *.j set filetype=objc

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
nnoremap <silent> <C-\> :call <SID>align()<CR>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>j
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>k

function ToggleRelativeNumbers()
  if &nu
    set rnu
  else
    set nu
  endif
endfunction

" Show relative line numbers
noremap <Leader>l :call ToggleRelativeNumbers()<Enter>

