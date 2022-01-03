{ config, pkgs, ... }:

let extraConfig = builtins.readFile ./init.vim;
in {
  imports = [ ./plugins.nix ];

  programs.neovim = {
    inherit extraConfig;
  };
}
