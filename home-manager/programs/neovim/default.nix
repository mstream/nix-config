{ pkgs, ... }:

{
  enable = true;
  extraConfig = import ./config.nix; 
  plugins = import ./plugins.nix pkgs;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
}

