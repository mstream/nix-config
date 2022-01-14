let s:document_width = 72
let s:indentation_width = 2

let g:airline_theme='base16_gruvbox_dark_medium'
let g:mapleader = " "
let g:maplocalleader = ","

filetype plugin indent on
syntax on

set   autoindent
set   background=dark
set   backup
set   backupcopy=yes
set   backupdir=~/.local/share/nvim/backup
set   clipboard=unnamed
set   cmdheight=1
let  &colorcolumn = s:document_width + 1
set   completeopt+=menu,menuone,noselect
set   conceallevel=0
set   encoding=utf-8
set   expandtab
set   fileencoding=utf-8
set   fileformat=unix
set   fixendofline
set   laststatus=0
set   termguicolors
set   hidden
set   ignorecase
set   number
set   omnifunc=syntaxcomplete#Complete
set   relativenumber
let  &shiftwidth = s:indentation_width
set   shortmess+=c
set noshowmode
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

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <unique> <A-h> <C-w>h
nnoremap <unique> <A-j> <C-w>j
nnoremap <unique> <A-k> <C-w>k
nnoremap <unique> <A-l> <C-w>l

nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <unique> <Leader>nh :nohlsearch<CR>

tnoremap <Up> <NOP>
tnoremap <Down> <NOP>
tnoremap <Right> <NOP>
tnoremap <Left> <NOP>

xnoremap <Up> <NOP>
xnoremap <Down> <NOP>
xnoremap <Right> <NOP>
xnoremap <Left> <NOP>

autocmd BufNewFile,BufRead *.dhall setf dhall
autocmd BufNewFile,BufRead *.nix setf nix
autocmd BufNewFile,BufRead *.purs setf purescript
autocmd BufWritePre *.dhall lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.nix lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.purs lua vim.lsp.buf.formatting_sync(nil, 1000)

augroup gruvbox
  autocmd!
  autocmd VimEnter * ++nested colorscheme gruvbox
augroup END

lua << EOF
local cmp = require'cmp'
local devicons = require"nvim-web-devicons"
local nvim_lsp = require('lspconfig')
local util = require 'lspconfig.util'
local servers = {
  'dhall_lsp_server',
  'rnix',
  'purescriptls',
}

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

devicons.setup({default = true,})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) 
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, 
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  },
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'omni' },
      { name = 'vsnip' }, 
      { name = 'calc' },
      { name = 'spell' },
      { name = 'emoji' },
      { name = 'path' },
      { name = 'buffer' },
    }
  ),
})

cmp.setup.cmdline(
  '/', 
  {
    sources = cmp.config.sources({
      { name = 'buffer' },
--    { name = 'nvim_lsp_document_symbol' },
      }
    )
  }
)

cmp.setup.cmdline(
  ':', 
  {
    sources = cmp.config.sources(
      { { name = 'cmdline' }, }
    ),
  }
)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {},

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

for _, lsp in ipairs(servers) do
  if lsp == 'purescriptls' then
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      flags = { debounce_text_changes = 150,},
      on_attach = on_attach,
      root_dir = util.root_pattern('spago.dhall', 'flake.nix', 'psc-package.json', 'bower.json') or util.find_git_ancestor,
      settings = {
        purescript = {
          formatter = "purs-tidy",
        },
      },
    }
  else 
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = on_attach,
    }
  end
end
EOF

