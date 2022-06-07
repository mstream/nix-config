let s:document_width = 72
let s:indentation_width = 2

filetype plugin indent on
syntax on

autocmd BufNewFile,BufRead *.dhall setf dhall
autocmd BufNewFile,BufRead *.js setf javascript
autocmd BufNewFile,BufRead *.nix setf nix
autocmd BufWritePre *.dhall lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.lhs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.nix lua vim.lsp.buf.formatting_sync(nil, 1000)

augroup purescript
  autocmd!
  autocmd BufNewFile,BufRead *.purs setf purescript
  autocmd BufWritePre *.purs lua vim.lsp.buf.code_action({ source = { organizeImports = true } })
  autocmd BufWritePre *.purs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

augroup gruvbox
  autocmd!
  autocmd VimEnter * ++nested colorscheme gruvbox
augroup END

lua << EOF
local cmp = require'cmp'
local devicons = require"nvim-web-devicons"
local document_width=72
local indentation_width=2
local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local util = require 'lspconfig.util'
local servers = {
  'dhall_lsp_server',
  'hls',
  'purescriptls',
  'rnix',
  'tsserver'
}

vim.g.airline_theme='base16_gruvbox_dark_medium'
vim.g.mapleader=' '
vim.g.maplocalleader=','

vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backup = true
vim.opt.backupdir = os.getenv( "HOME" ) .. '/.local/share/nvim/backup'
vim.opt.clipboard = 'unnamed'
vim.opt.cmdheight = 1
vim.opt.completeopt = {'menu', 'menuone','noselect','preview'}
vim.opt.colorcolumn = tostring(document_width + 1)
vim.opt.conceallevel = 0
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformat = 'unix'
vim.opt.fixendofline = true
vim.opt.laststatus = 0
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.relativenumber = true
vim.opt.shiftwidth = indentation_width
vim.opt.shortmess = 'filnxtToOFc'
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.spell = true
vim.opt.spelllang = {'en_us'}
vim.opt.tabstop = indentation_width
vim.opt.updatetime = 300
vim.opt.wrap = false
vim.opt.writebackup = false

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_set_keymap('c', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Left>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, unique = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, unique = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, unique = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, unique = true })

vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>nh', ':nohlsearch<CR>', { noremap = true, unique = true })

vim.api.nvim_set_keymap('t', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Left>', '<NOP>', { noremap = true })

vim.api.nvim_set_keymap('x', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Left>', '<NOP>', { noremap = true })

lsp_status.register_progress()

devicons.setup({default = true,})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) 
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),  
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
  ensure_installed = {
    'bash',
    'css',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'typescript',
    'yaml'
  },
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

  lsp_status.on_attach(client)

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
    lspconfig[lsp].setup {
      capabilities = capabilities,
      flags = { debounce_text_changes = 150,},
      on_attach = on_attach,
      root_dir = util.root_pattern('spago.dhall', 'flake.nix', 'psc-package.json', 'bower.json') or util.find_git_ancestor,
      settings = {
        purescript = {
          buildOpenedFiles = true,
          formatter = "purs-tidy",
          fullBuildOnSave = true,
        },
      },
    }
  else 
    lspconfig[lsp].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = on_attach,
    }
  end
end
EOF

