{ pkgs, ... }:

{
  home-manager.enable = true;
  direnv = import ./direnv pkgs;
  neovim = import ./neovim pkgs;
  zsh = import ./zsh pkgs;
}
