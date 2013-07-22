execute pathogen#infect()
syntax on
filetype plugin indent on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

let mapleader = ","
set nocompatible
set encoding=utf-8
set shell=/bin/zsh
set relativenumber
set undodir^=~/.vim/undo
set ttyfast
inoremap jj <ESC>

" make keypad work in vim with iTerm on OS X!
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab

set shiftround

set incsearch
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

set laststatus=2
set ruler
set showcmd
set wildmenu

set scrolloff=1
set sidescrolloff=5
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif 

set autoread
set fileformats+=mac

set history=1000
set tabpagemax=50
set viminfo^=!

set t_Co=256

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$
