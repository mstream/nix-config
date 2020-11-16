{ pkgs, ... }:

{
  direnv = import ./direnv pkgs;
  git = import ./git pkgs;
  home-manager.enable = true;
  kitty = import ./kitty pkgs;
  neovim = import ./neovim pkgs;
  password-store = import ./password-store pkgs;
  zsh = import ./zsh pkgs;
}
