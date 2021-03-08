function! s:show_documentation()
  if (index(["vim","help"], &filetype) >= 0)
    execute "h ".expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


let s:document_width = 72
let s:indentation_width = 2
let s:prettier_options =
      \ " --print-width=" . s:document_width
      \ . " --tab-width=" . s:indentation_width
      \ . " --write"

" let g:autoformat_verbosemode=1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_make_output_file = "dist/elm.js"
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:formatdef_dhall_format =
      \ "\"dhall format"
      \ . "\""
let g:formatdef_elm_format =
      \ "\"elm-format"
      \ . " --stdin"
      \ . " --upgrade"
      \ . " --yes"
      \ . "\""
let g:formatdef_nixfmt =
      \ "\"nixfmt"
      \ . " --width=" . s:document_width
      \ . "\""
let g:formatdef_prettier_json =
      \ "\"prettier"
      \ . " --parser=json"
      \ . s:prettier_options
      \ . "\""
let g:formatdef_prettier_markdown =
      \ "\"prettier"
      \ . " --parser=markdown"
      \ . s:prettier_options
      \ . "\""
let g:formatdef_prettier_yaml =
      \ "\"prettier"
      \ . " --parser=yaml"
      \ . " --single-quote=true"
      \ . s:prettier_options
      \ . "\""
let g:formatdef_purty =
      \ "\"purty format"
      \ . " --write"
      \ . " -"
      \ . "\""
let g:formatters_dhall = ["dhall_format"]
let g:formatters_elm = ["elm_format"]
let g:formatters_json = ["prettier_json"]
let g:formatters_markdown = ["prettier_markdown"]
let g:formatters_nix = ["nixfmt"]
let g:formatters_purescript = ["purty"]
let g:formatters_yaml = ["prettier_yaml"]
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1
let g:gruvbox_transparent_bg = 1
let g:mapleader = " "
let g:purescript_disable_indent = 1
let g:timeoutlen = 1000

syntax on
filetype on
filetype plugin indent on

set   autoindent
set   background=dark
set   backup
set   backupcopy=yes
set   backupdir=~/.local/share/nvim/backup
set   cmdheight=2
let  &colorcolumn = s:document_width + 1
set   expandtab
set   fileencoding=utf-8
set   fileformat=unix
set   fixendofline
set   termguicolors
set   hidden
set   ignorecase
set   number
set   relativenumber
set   rulerformat=%l,%v
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
inoremap <unique> <A-h> <C-\><C-N><C-w>h
inoremap <unique> <A-j> <C-\><C-N><C-w>j
inoremap <unique> <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
inoremap <expr><unique> <Tab> pumvisible()
      \ ? "\<C-n>"
      \ : "\<Tab>"
inoremap <expr><unique> <S-Tab> pumvisible()
      \ ? "\<C-p>"
      \ : "\<S-Tab>"
inoremap <expr> <CR> pumvisible()
      \ ? coc#_select_confirm()
      \ : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)
nmap <unique> <Leader>cs <Plug>(coc-rename)
nmap <unique> <Leader>g[ <Plug>(coc-diagnostic-prev)
nmap <unique> <Leader>g] <Plug>(coc-diagnostic-next)
nmap <unique> <Leader>gd <Plug>(coc-definition)
nmap <unique> <Leader>gy <Plug>(coc-type-definition)
nmap <unique> <Leader>gi <Plug>(coc-implementation)
nmap <unique> <Leader>gr <Plug>(coc-references)

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <unique> <A-h> <C-w>h
nnoremap <unique> <A-j> <C-w>j
nnoremap <unique> <A-k> <C-w>k
nnoremap <unique> <A-l> <C-w>l
nnoremap <unique> <Leader>a :CocAction<CR>
nnoremap <unique> <Leader>c :CocCommand<CR>
nnoremap <unique> <Leader>lb :CocList buffers<CR>
nnoremap <unique> <Leader>lc :CocList vimcommands<CR>
nnoremap <unique> <Leader>ld :CocList diagnostics<CR>
nnoremap <unique> <Leader>lf :CocList files<CR>
nnoremap <unique> <Leader>lg :CocList grep<CR>
nnoremap <unique> <Leader>ls :CocList snippets<CR>
nnoremap <unique> <Leader>ly :CocList yank<CR>
nnoremap <unique> <Leader>nh :nohlsearch<CR>
nnoremap <unique> <Leader>sd :call <SID>show_documentation()<CR>

tnoremap <Up> <NOP>
tnoremap <Down> <NOP>
tnoremap <Right> <NOP>
tnoremap <Left> <NOP>
tnoremap <unique> <A-h> <C-\><C-N><C-w>h
tnoremap <unique> <A-j> <C-\><C-N><C-w>j
tnoremap <unique> <A-k> <C-\><C-N><C-w>k
tnoremap <unique> <A-l> <C-\><C-N><C-w>l

xnoremap <Up> <NOP>
xnoremap <Down> <NOP>
xnoremap <Right> <NOP>
xnoremap <Left> <NOP>

augroup activewindow
  autocmd!
  autocmd WinEnter * setlocal
        \ number
        \ relativenumber
  autocmd WinLeave * setlocal
        \ nonumber
        \ norelativenumber
augroup END

augroup autoformat
  autocmd!
  autocmd BufWrite * :Autoformat
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit let b:autoformat_autoindent=0
augroup END

augroup coc
  autocmd!
  autocmd CursorHold * call CocActionAsync("highlight")
augroup END

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

augroup terminalwindow
  autocmd!
  autocmd TermOpen * setlocal
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
  autocmd TermOpen * startinsert
  autocmd BufEnter term://* startinsert
augroup END
