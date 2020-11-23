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
      "command" = "rnix-lsp";
      "filetypes" = [ "nix" ];
    };
  };
}
