{ pkgs, ... }:

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
    awscli2
    dhall-bash
    dhall-json
    dhall-nix
    gimp
    idris2
    inkscape
    netlify-cli
    niv
    spago
  ];

  imports = [ ./programs ];
}
