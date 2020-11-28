set   autoindent 
set   background=dark
set nobackup
set   backupcopy=yes
set   cmdheight=2
set   colorcolumn=72
set   expandtab
set   fileencoding=utf-8
set   fileformat=unix
set   fixendofline
set   hidden
set   ignorecase
set   number
set   relativenumber 
set   rulerformat=%l,%v
set   shiftwidth=2
set   shortmess+=c
set   showtabline=1 
set   signcolumn=yes
set   smartcase
set   tabstop=2
set   updatetime=300
set nowrap
set nowritebackup


cnoremap <Up> <NOP>
cnoremap <Down> <NOP>
cnoremap <Right> <NOP>
cnoremap <Left> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

tnoremap <Up> <NOP>
tnoremap <Down> <NOP>
tnoremap <Right> <NOP>
tnoremap <Left> <NOP>

xnoremap <Up> <NOP>
xnoremap <Down> <NOP>
xnoremap <Right> <NOP>
xnoremap <Left> <NOP>

augroup terminal
  autocmd!
  autocmd TermOpen * :setlocal 
                   \ nonumber 
                   \ norelativenumber 
                   \ signcolumn=no
augroup END



