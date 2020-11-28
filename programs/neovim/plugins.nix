{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dhall-lsp-server
    nodejs-12_x
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.purescript-language-server
    purescript
    rnix-lsp
  ];


  
  programs.neovim.plugins = with pkgs.vimPlugins; [
    coc-css
    coc-emmet
    coc-eslint
    coc-git
    coc-highlight
    coc-html
    coc-java
    coc-jest
    coc-json
    coc-lists
    coc-neco
    coc-nvim
    coc-pairs
    coc-prettier
    coc-python
    coc-r-lsp
    coc-rls
    coc-solargraph
    coc-snippets
    coc-stylelint
    coc-tslint-plugin
    coc-tsserver
    coc-vetur
    coc-vimtex
    coc-wxml
    coc-yank
    coc-yaml
    dhall-vim
    emmet-vim
    indentLine
    purescript-vim
    vim-airline
    vim-nix
  ];
}


