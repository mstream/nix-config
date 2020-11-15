{ pkgs, ... }:

{
  direnv = import ./direnv pkgs;
  home-manager.enable = true;
  kitty = import ./kitty pkgs;
  neovim = import ./neovim pkgs;
  zsh = import ./zsh pkgs;
}
