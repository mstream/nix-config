let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1

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
set   notermguicolors
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
inoremap <expr> <Tab> pumvisible() 
                      \ ? "\<C-n>" 
                      \ : "\<Tab>"

inoremap <expr> <S-Tab> pumvisible() 
                        \ ? "\<C-p>" 
                        \ : "\<S-Tab>"

 inoremap <silent><expr> <CR> pumvisible() 
                              \ ? coc#_select_confirm() 
                              \ : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

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

augroup gruvbox
  autocmd!
  autocmd VimEnter * ++nested colorscheme gruvbox
augroup END

augroup smartf
  autocmd!
  autocmd User SmartfEnter :highlight 
                           \ Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :highlight 
                           \ Conceal ctermfg=239 guifg=#504945
augroup END

augroup terminal
  autocmd!
  autocmd TermOpen * :setlocal 
                     \ nonumber 
                     \ norelativenumber 
                     \ signcolumn=no
augroup END

