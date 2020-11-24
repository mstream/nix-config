{ config, ... }:

{
  diagnostic = { 
    checkCurrentLine = true;
  };
  languageserver = {
    dhall = {
      command = "dhall-lsp-server";
      filetypes = [ "dhall" ];
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
      settings = {
        purescript = {
          addSpagoSources = true;
        };
      };
    };
  };
}
