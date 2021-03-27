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
    coreutils
    docker
    kind
    gimp
    gradle
    graphviz
    inkscape
    niv
    unixtools.watch
  ];

  imports = [ ./programs ];

  home.file = with pkgs; {
    "Development/jdk/11".source = jdk11;
    "Development/jdk/14".source = jdk14;
    "Development/node/12".source = nodejs-12_x;
    "Development/node/14".source = nodejs-14_x;
  };
}
