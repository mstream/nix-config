{ config, pkgs, ... }:

let extraConfig = builtins.readFile ./init.vim;
in {
  imports = [ ./plugins.nix ];

  programs.neovim = {
    inherit extraConfig;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
