{ pkgs, ... }:

{
  home-manager.enable = true;
  neovim = import ./neovim pkgs;
  zsh = import ./zsh pkgs;
}
