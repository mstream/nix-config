{ pkgs, ... }:

let
  importConfig = path : import path { inherit pkgs; };
in {
  direnv = importConfig ./direnv;
  git = importConfig ./git;
  gpg = importConfig ./gpg;
  home-manager = importConfig ./home-manager;
  kitty = importConfig ./kitty;
  neovim = importConfig ./neovim;
  password-store = importConfig ./password-store;
  zsh = importConfig ./zsh;
}
