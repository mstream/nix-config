{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dhall-lsp-server
    fzf
    nodejs-12_x
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.purescript-language-server
    nodePackages.vim-language-server
    rnix-lsp
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    coc-emmet
    coc-eslint
    coc-git
    coc-highlight
    coc-html
    coc-java
    coc-json
    coc-markdownlint
    coc-nvim
    coc-pairs
    coc-prettier
    coc-spell-checker
    coc-tsserver
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


