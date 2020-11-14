{ pkgs, ... }:

{
  home.username = "mstream";
  home.homeDirectory = "/Users/mstream";
  home.stateVersion = "20.09";

  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    SHELL = "zsh";
    VISUAL = "nvim";
  };

  home.packages = [
  ];

  programs = import ./programs pkgs;
}

