{ config, pkgs, ... }:
{
  imports = [ ./ale ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
