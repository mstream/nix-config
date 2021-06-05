{ config, pkgs, ... }:

{
  programs.kakoune = {
    config = {
      numberLines = {
        enable = true;
        relative = true;
      };
      colorScheme = "gruvbox";
      incrementalSearch = true;
      indentWidth = 4;
      ui = {
        enableMouse = false;
        setTitle = true;
      };
    };
    enable = true;
  };
}
