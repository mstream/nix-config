{ pkgs, ... }:

{
  home.packages = with pkgs; [
    astyle
    dhall
    dhall-lsp-server
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-language-server
    elmPackages.elm-test
    go
    html-tidy
    llvm
    nixfmt
    nodejs-12_x
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.js-beautify
    nodePackages.purescript-language-server
    nodePackages.purty
    purescript
    python3
    python38Packages.autopep8
    ripgrep
    rnix-lsp
    rustfmt
    shfmt
    stylish-haskell
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
    coc-smartf
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
    gruvbox
    indentLine
    purescript-vim
    vim-airline
    vim-autoformat
    vim-nix
    vim-snippets
    vim-startify
  ];
}
