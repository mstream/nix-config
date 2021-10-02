{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    delta
    dhall
    fzf
    perl
    ripgrep
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    ale
    deoplete-nvim
    fzf-vim
    gruvbox
    vim-polyglot
  ];
}
