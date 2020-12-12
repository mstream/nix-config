{ config, ... }:

{
  diagnostic = { checkCurrentLine = true; };
  languageserver = {
    bash = {
      command = "bash-language-server";
      args = [ "start" ];
      filetypes = [ "sh" ];
      ignoredRootPaths = [ "~" ];
    };
    dhall = {
      command = "dhall-lsp-server";
      filetypes = [ "dhall" ];
    };
    dockerfile = {
      command = "bash-language-server";
      args = [ "start" ];
      filetypes = [ "dockerfile" ];
    };
    elm = {
      command = "elm-language-server";
      filetypes = [ "elm" ];
      rootPatterns = [ "elm.json" ];
      codeLens = { enable = true; };
    };
    nix = {
      command = "rnix-lsp";
      filetypes = [ "nix" ];
    };
    purescript = {
      command = "purescript-language-server";
      args = [ "--stdio" ];
      filetypes = [ "purescript" ];
      rootPatterns = [ "spago.dhall" ];
      settings = { purescript = { addSpagoSources = true; }; };
    };
  };
  smartf = {
    timeout = 1000;
    charactersIgnoreByNavigator = [
      "0"
      "a"
      "b"
      "c"
      "d"
      "e"
      "f"
      "g"
      "h"
      "i"
      "j"
      "k"
      "l"
      "m"
      "n"
      "o"
      "p"
      "q"
      "r"
      "s"
      "t"
      "u"
      "v"
      "w"
      "x"
      "y"
      "z"
    ];
  };
}
