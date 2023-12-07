set cursorline
set laststatus=2
set number
set scrolloff=1
set textwidth=100

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set splitbelow
set splitright

" split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

let mapleader = " "
set encoding=utf-8
set fileformat=unix

" python
au BufNewFile,BufRead *.py
  \ set autoindent      |
  \ set smartindent

" c, c++
au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp
  \ set cindent
