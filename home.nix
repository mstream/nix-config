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
    browsh
    cargo
    docker
    kind
    gimp
    gradle
    graphviz
    inkscape
    jdk
    niv
    unixtools.watch
  ];

  imports = [ ./programs ];
}
