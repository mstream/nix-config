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
    idris2
    nixpkgs-fmt
    spago
  ];

  imports = [ ./programs ];
}