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
set   number
set   relativenumber 
set   rulerformat=%l,%v
set   shiftwidth=2
set   shortmess+=c
set   showtabline=1 
set   signcolumn=yes
set   tabstop=2
set   updatetime=300
set nowrap
set nowritebackup

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>

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
  autocmd TermOpen * :set nonumber norelativenumber
augroup END



