filetype on
set nocompatible
set number
set antialias
set softtabstop=2
colorscheme macvim
syntax on

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

let mapleader = ","
