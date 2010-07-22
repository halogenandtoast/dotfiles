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

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>j
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>k
