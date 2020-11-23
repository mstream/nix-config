{ config, pkgs, ... }:

let
  cocSettings = builtins.import ./coc-settings.nix;

in
{
  programs.neovim = 
  {
    enable = true;
    extraConfig = import ./config.nix; 
    plugins = import ./plugins.nix pkgs;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true; 
  };
  
  xdg.configFile."nvim/coc-settings.json".source =
      builtins.toFile "coc-settings.json" 
                      (builtins.toJSON (cocSettings { inherit config; }));
}

