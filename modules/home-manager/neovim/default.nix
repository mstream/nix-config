{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  extraConfig = builtins.readFile ./init.vim;
  plugins = with pkgs.vimPlugins; [
    cmp-buffer
    cmp-calc
    cmp-emoji
    cmp-nvim-lsp
    cmp-nvim-lsp-document-symbol
    cmp-omni
    cmp-path
    cmp-spell
    cmp-vsnip
    dhall-vim
    gruvbox
    lsp_signature-nvim
    nvim-cmp
    nvim-lspconfig
    nvim-treesitter
    nvim-web-devicons
    plenary-nvim
    purescript-vim
    telescope-nvim
    vim-airline
    vim-airline-themes
    vim-vsnip
  ];
}
