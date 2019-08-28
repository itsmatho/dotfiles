" ~/.vimrc`

" **************************************
" * VARIABLES
" **************************************
set nocompatible		" get rid of strict vi compatibility!
set nu
set autoindent			" autoindent on
set noerrorbells		" bye bye bells :)
set modeline			" show what I'm doing
set showmode			" show the mode on the dedicated line (see above)
set wrap
set linebreak
set nolist
set textwidth=0 wrapmargin=0
set formatoptions=l
set backspace=indent,eol,start	" backspace over everything
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
set nojoinspaces		" don't add white space when I don't tell you to
set ruler			" which line am I on?
set showmatch			" ensure Dyck language
set incsearch			" incremental searching
set nohlsearch			" meh
set bs=2			" fix backspacing in insert mode
set bg=light
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set wildmode=longest,list,full " tab complete files
set wildmenu " menu for tab completion for files
set timeoutlen=1000 ttimeoutlen=50

" Expand tabs in C-like files to spaces
augroup clikefiles
  au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set expandtab
  au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set shiftwidth=4
  au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set tabstop=4
augroup END

" Do not expand tabs in assembly file.  Make them 8 chars wide.
augroup asmfiles
  au BufRead,BufNewFile *.s set noexpandtab
  au BufRead,BufNewFile *.s set shiftwidth=8
  au BufRead,BufNewFile *.s set tabstop=8
augroup END

augroup flake8onsave
  autocmd BufWritePost *.py call Flake8()
augroup END

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

nnoremap X ^D

" Show status line %f%m%r%h%w
set laststatus=2
set statusline=%<%F%=%4v,%4l\ %3p%%\ of\ %L

" Turn on plugins with pathogen
execute pathogen#infect()
Helptags

" This is my prefered colorscheme, open a file with gvim to view others
colors elflord_better

let python_highlight_all=1
syntax on
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:flake8_show_quickfix = 0
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':p:~'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = ' -Wall -g -DLINUX'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:syntastic_python_checkers = ['flake8']

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
