{ pkgs, ... }:

{
  enable = true;
  plugins = import ./plugins.nix pkgs;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
}
