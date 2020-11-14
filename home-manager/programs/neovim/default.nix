{ pkgs, ... }:

{
  enable = true;
  extraConfig = ''
    set   cmdheight=2
    set   colorcolumn=80
    set   expandtab
    set   hidden
    set   number
    set   relativenumber 
    set   shortmess+=c
    set   signcolumn=yes
    set   tabstop=2
    set   updatetime=300
    set nowrap
    set nowritebackup

  '';
  plugins = import ./plugins.nix pkgs;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
}

