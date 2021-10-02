let s:document_width = 72
let s:indentation_width = 2
let s:common_ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

let g:ale_sign_column_always = 1
let g:deoplete#enable_at_startup = 1
let g:mapleader = " "

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = 
\ {
\   'dhall': 
\     [
\       'dhall-format', 
\       'dhall-lint', 
\       'dhall-freeze',
\     ] + s:common_ale_fixers
\   ,
\   'javascript': 
\     [
\       'eslint', 
\       'importjs', 
\       'prettier', 
\     ] + s:common_ale_fixers
\     ,
\   'purescript': 
\     [
\       'purs-tidy', 
\     ] + s:common_ale_fixers
\ }

let g:ale_linters = 
\ {
\   'javascript': 
\     [
\       'eslint', 
\       'tsserver', 
\     ]
\ }

g:ale_purescript_ls_config =
\ {
\   'purescript': {
\     'addSpagoSources': v:true,
\     'addNpmPath': v:true,
\     'buildCommand': 'spago --quiet build --purs-args --json-errors'
\   }
\ }

function! s:set_completion_sources()
  call deoplete#custom#option("sources", {
  \ "_": ["ale"],
  \})
endfunction

function! FormatPurescript(buffer) abort
    return {
    \   'command': 'purs-tidy format --import-wrap-auto --unicode-always --width ' 
    \              . s:document_width
    \}
endfunction



syntax on
filetype on
filetype plugin indent on

set   autoindent
set   background=dark
set   backup
set   backupcopy=yes
set   backupdir=~/.local/share/nvim/backup
set   clipboard=unnamed
set   cmdheight=2
let  &colorcolumn = s:document_width + 1
set   conceallevel=0
set   expandtab
set   fileencoding=utf-8
set   fileformat=unix
set   fixendofline
set   termguicolors
set   hidden
set   ignorecase
set   number
set   relativenumber
let  &shiftwidth = s:indentation_width
set   shortmess+=c
set   showtabline=1
set   signcolumn=yes
set   smartcase
let  &tabstop = s:indentation_width
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

inoremap <expr><unique> <C-j> pumvisible()
\ ? "\<C-n>"
\ : "\<C-j>"

inoremap <expr><unique> <Tab> pumvisible()
\ ? "\<C-n>"
\ : "\<Tab>"

inoremap <expr><unique> <C-k> pumvisible()
\ ? "\<C-p>"
\ : "\<C-k>"

inoremap <expr><unique> <S-Tab> pumvisible()
\ ? "\<C-p>"
\ : "\<S-Tab>"

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <unique> <A-h> <C-w>h
nnoremap <unique> <A-j> <C-w>j
nnoremap <unique> <A-k> <C-w>k
nnoremap <unique> <A-l> <C-w>l

nnoremap <expr><unique> <Leader>lf len(system("git rev-parse"))
\ ? ":Files"."\<CR>"
\ : ":GFiles --cached --exclude-standard --others"."\<CR>"

nnoremap <unique> <Leader>nh :nohlsearch<CR>

tnoremap <Up> <NOP>
tnoremap <Down> <NOP>
tnoremap <Right> <NOP>
tnoremap <Left> <NOP>

xnoremap <Up> <NOP>
xnoremap <Down> <NOP>
xnoremap <Right> <NOP>
xnoremap <Left> <NOP>

augroup ale
  autocmd!
  autocmd VimEnter * execute ale#fix#registry#Add(
\   'purs-tidy', 
\   'FormatPurescript', 
\   ['purescript'], 
\   'Format using purs-tidy'
\ )
augroup END

augroup deoplete
  autocmd!
  autocmd VimEnter * call set_completion_sources()
augroup END

augroup gruvbox
  autocmd!
  autocmd VimEnter * ++nested colorscheme gruvbox
augroup END

