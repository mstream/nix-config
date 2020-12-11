{ config, pkgs, ... }:
let
  cocSettings = builtins.import ./coc-settings.nix;
  extraConfig = builtins.readFile ./init.vim;

in {
  imports = [ ./plugins.nix ];

  programs.neovim = {
    inherit extraConfig;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };

  xdg.configFile."nvim/coc-settings.json".source =
    builtins.toFile "coc-settings.json"
    (builtins.toJSON (cocSettings { inherit config; }));
}
