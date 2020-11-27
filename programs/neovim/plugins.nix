{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    dhall-lsp-server
    fzf
    nodejs-12_x
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.purescript-language-server
    rnix-lsp
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    coc-css
    coc-emmet
    coc-eslint
    coc-fzf
    coc-git
    coc-go
    coc-highlight
    coc-html
    coc-java
    coc-jest
    coc-json
    coc-lists
    coc-markdownlint
    coc-metals
    coc-neco
    coc-nvim
    coc-pairs
    coc-prettier
    coc-python
    coc-r-lsp
    coc-rls
    coc-rust-analyzer
    coc-solargraph
    coc-snippets
    coc-spell-checker
    coc-stylelint
    coc-tslint
    coc-tslint-plugin
    coc-tsserver
    coc-vetur
    coc-vimlsp
    coc-vimtex
    coc-wxml
    coc-yank
    coc-yaml
    dhall-vim
    emmet-vim
    fzf-vim
    purescript-vim
    vim-airline
    vim-nix
    vim-surround
  ];
}


