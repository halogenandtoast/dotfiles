set nocompatible
filetype plugin indent on
runtime macros/matchit.vim
" set clipboard=unnamed
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*.swp
set backspace=
set shortmess=atI
set visualbell
set isfname-=:
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

noremap <BACKSPACE> ""
:nmap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set ttimeoutlen=50

autocmd BufEnter *.haml setlocal cursorcolumn
autocmd BufEnter *.sass setlocal cursorcolumn
autocmd BufRead,BufNewFile *.jst set filetype=html

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

if has('gui_running')
  set background=light
  color solarized
else
  let g:solarized_termcolors=256
  set background=light
  color solarized
endif
call togglebg#map("<F6>")

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

imap jk <Esc>
imap kj <Esc>
set pastetoggle=<F7>

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! OpenWithLineNumber()
  let l:list = split(expand("%"), ":")
  let l:filename = list[0]
  let l:filenum = get(list, 1)
  exe 'e! '. filename
  exe ':'.filenum
endfunction
noremap <Leader>] :call OpenWithLineNumber()<Enter>

function! RenameFile(new_name)
  exe 'sav '.expand("%:p:h").'/'.a:new_name
  call delete(expand("#"))
endfunction

command! -nargs=1 Rename call RenameFile(<f-args>)

nnoremap ≥ :call MoveToNextTab()<CR>
nnoremap ≤ :call MoveToPrevTab()<CR>

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
       \ | wincmd p | diffthis
