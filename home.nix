{ config, pkgs, ... }:

let
  coc = import ./coc.nix;
in 
{
  home.username = "mstream";
  home.homeDirectory = "/Users/mstream";
  home.stateVersion = "20.09";

  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    PAGER = "less";
    SHELL = "zsh";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    dhall-lsp-server
    nodejs-12_x
  ];

  programs = import ./programs pkgs;

  xdg.configFile."nvim/coc-settings.json".source =
      builtins.toFile "coc-settings.json" 
                      (builtins.toJSON (coc { inherit config; }));
}

