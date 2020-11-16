{ pkgs, ... }:

with pkgs.vimPlugins; [
  coc-git
  coc-html
  coc-java
  coc-json
  coc-markdownlint
  coc-nvim
  coc-spell-checker
  coc-yaml
  dhall-vim
  purescript-vim
]

