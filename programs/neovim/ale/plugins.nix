{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    delta
    dhall
    fzf
    nodePackages.htmlhint
    nodePackages.prettier
    perl
    ripgrep
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    agda-vim
    ale
    deoplete-nvim
    fzf-vim
    gruvbox
    idris2-vim
    vim-polyglot
  ];
}
