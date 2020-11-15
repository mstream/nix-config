{ pkgs, ... }:

{
  direnv = import ./direnv pkgs;
  home-manager.enable = true;
  kitty = import ./kitty pkgs;
  neovim = import ./neovim pkgs;
  password-store = import ./password-store pkgs;
  zsh = import ./zsh pkgs;
}
