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
    dhall-lsp-server
    idris2
    nodejs-12_x
    nodePackages.purescript-language-server
    rnix-lsp
    spago
  ];

  imports = [ ./programs ];
}

