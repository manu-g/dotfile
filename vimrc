""""""""""
" Plugins
""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'
Plugin 'nerdtree'
Plugin 'sparkup'
Plugin 'command-t'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required





""""""""""
" General
""""""""""

" number of history lines
set history=700

filetype plugin indent on

" set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

"""""""""
" Color
"""""""""

colorscheme molokai
set background=light

" syntax highlighting
syntax enable

" standard encoding
set encoding=utf8

" standard file type
set ffs=unix,dos


"""""""""""""""""""""
" Text, tab, indent
"""""""""""""""""""""

" space instead of tab
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" linebreak on 500 characters
set lbr
set tw=500


""""""""""""""""""""""
" vim user interface
""""""""""""""""""""""

syn on se title

set number
set showcmd
set cursorline

" Don't redraw while executing macros (good performance config)
set lazyredraw

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" show matching brackets
set showmatch

set wildmenu
" set incsearch
set hlsearch
execute pathogen#infect()

set nocompatible

set hls!

"""""""""""""""""""""""""""""""""
" moving, tabs, windows, buffer
"""""""""""""""""""""""""""""""""

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" close current buffer
map <leader>bd :Bclose<cr>

" close all buffers
map <leader>ba :1,1000 bd!<cr>

" manage tabs
map <leader>ttn :tabnext<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

map <leader>bn :bnext<cr>

" open new tab with current buffers path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost*
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""
" map
"""""""

map <C-n> :NERDTreeToggle<CR>

" move lines of text using ALT+[jk]
map <C-S-j> :m+<cr>
map <C-S-k> :m-2<cr>

set nohlsearch
nnoremap <leader><space> :nohlsearch<CR>

""""""""""""""""""
" spell checking
""""""""""""""""""

" pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" shortcut
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""
" statusline
""""""""""""""

" set color mode
set t_Co=256

" always show status line
set laststatus=2

set rulerformat=%-14.(%l,%c%V%)\ %P

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ [%{''.(&fenc!=''?&fenc:&enc).''}]      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ [%03c\ %l/%L\ (%03p%%)]\             "Rownumber/total (%)
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'airlineish'

""""""""""""""""""""
" helper functions
""""""""""""""""""""

function! HighlightSearch()
	if &hls
		return 'H'
	else
		return ''
	endif
endfunction


