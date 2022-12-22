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
  'java_language_server',
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
vim.opt.completeopt = {'menu', 'menuone','noselect'}
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

function disable_arrow_keys (mode)
  vim.api.nvim_set_keymap(
    mode,
    '<Up>',
    '<NOP>',
    { noremap = true }
  )

  vim.api.nvim_set_keymap(
    mode,
    '<Down>',
    '<NOP>',
    { noremap = true }
  )

  vim.api.nvim_set_keymap(
    mode,
    '<Right>',
    '<NOP>',
    { noremap = true }
  )

  vim.api.nvim_set_keymap(
    mode,
    '<Left>',
    '<NOP>',
    { noremap = true }
  )
end

disable_arrow_keys('c')
disable_arrow_keys('i')
disable_arrow_keys('n')

vim.api.nvim_set_keymap(
  'n', 
  '<A-h>', 
  '<C-w>h', 
  { noremap = true, unique = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<A-j>',
  '<C-w>j',
  { noremap = true, unique = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<A-k>',
  '<C-w>k',
  { noremap = true, unique = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<A-l>',
  '<C-w>l',
  { noremap = true, unique = true }
)

vim.api.nvim_set_keymap(
  'n', 
  '<Leader>ff', 
  '<cmd>Telescope find_files<CR>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', 
  '<Leader>fg', 
  '<cmd>Telescope live_grep<CR>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', 
  '<Leader>fb', 
  '<cmd>Telescope buffers<CR>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>fh',
  '<cmd>Telescope help_tags<CR>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>nh',
  ':nohlsearch<CR>', 
  { noremap = true, unique = true }
)

vim.api.nvim_set_keymap(
  't', 
  '<Up>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  't', 
  '<Down>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  't', 
  '<Right>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  't', 
  '<Left>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'x', 
  '<Up>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'x', 
  '<Down>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'x', 
  '<Right>', 
  '<NOP>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'x', 
  '<Left>', 
  '<NOP>', 
  { noremap = true }
)

function set_filetype_autocmd (args)
  vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    command = 'setf ' .. args.filetype,
    group = args.group_id,
    pattern = {'*.' .. args.extension},
  })
end

function set_formatting_sync_autocmd (args)
  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)',
    group = args.group_id,
    pattern = {'*.' .. args.extension},
  })
end

function create_augroup (args)
  local group_id = vim.api.nvim_create_augroup(
    args.name, 
    {clear = true}
  ) 

  set_filetype_autocmd({
    extension=args.extension,
    filetype=args.filetype,
    group_id=group_id,
  })

  set_formatting_sync_autocmd({
    extension=args.extension,
    group_id=group_id,
  })
end

create_augroup({
  extension='dhall',
  filetype='dhall',
  name='Dhall',
})

create_augroup({
  extension='gradle',
  filetype='groovy',
  name='Gradle',
})

create_augroup({
  extension='java',
  filetype='java',
  name='Java',
})

create_augroup({
  extension='js',
  filetype='javascript',
  name='JavaScript',
})

create_augroup({
  extension='nix',
  filetype='nix',
  name='Nix',
})

create_augroup({
  extension='purs',
  filetype='purescript',
  name='Purescript',
})

local gruvbox_group_id = vim.api.nvim_create_augroup(
  'GruvBox', 
  {clear = true}
) 

vim.api.nvim_create_autocmd({'VimEnter'}, {
    command = 'colorscheme gruvbox',
    group = gruvbox_group_id,
    pattern = {'*'},
  })

vim.api.nvim_create_autocmd(
  {'BufWritePre'}, 
  {
    command = 'lua vim.lsp.buf.code_action({ source = { organizeImports = true } })',
    group = purescript_group_id,
    pattern = {'*.purs'},
  }
)

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
      --{ name = 'omni' },
      { name = 'vsnip' }, 
      --{ name = 'calc' },
      --{ name = 'spell' },
      --{ name = 'emoji' },
      --{ name = 'path' },
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
    sources = cmp.config.sources({
      { { name = 'cmdline' }, }, { { name = 'path' } }
    }),
  }
)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'nvim-treesitter.configs'.setup {
  sync_install = false,
  ignore_install = {},

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', bufopts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', bufopts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', bufopts) 
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

for _, lsp in ipairs(servers) do
  if lsp == 'java_language_server' then
    lspconfig[lsp].setup {
      cmd = {'java-language-server'}
    }
  elseif lsp == 'purescriptls' then
    lspconfig[lsp].setup {
      capabilities = capabilities,
      flags = { debounce_text_changes = 150,},
      on_attach = on_attach,
      root_dir = util.root_pattern(
        'spago.dhall', 
        'flake.nix', 
        'psc-package.json', 
        'bower.json'
      ) or util.find_git_ancestor,
      settings = {
        purescript = {
          addSpagoSources = true,
          buildOpenedFiles = true,
          formatter = "purs-tidy",
          fullBuildOnSave = true,
        },
      },
    }
  elseif lsp == 'tsserver' then
    lspconfig[lsp].setup {
      capabilities = capabilities,
      cmd = {
        "typescript-language-server",
        "--stdio",
        "--tsserver-path",
        "/nix/store/i0b6bxss0zd5py08r1z11vjrav0l5a0w-typescript-4.6.4/lib/node_modules/typescript/lib/",
      },
      on_attach = on_attach,
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

