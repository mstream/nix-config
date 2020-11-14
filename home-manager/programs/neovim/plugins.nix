{ pkgs, ... }:

with pkgs; [
  vimPlugins.coc-git
  vimPlugins.coc-html
  vimPlugins.coc-java
  vimPlugins.coc-json
  vimPlugins.coc-markdownlint
  vimPlugins.coc-nvim
  vimPlugins.coc-spell-checker
  vimPlugins.coc-stylelint
  vimPlugins.coc-yaml
]
