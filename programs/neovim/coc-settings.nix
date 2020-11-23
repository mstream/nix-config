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
  };
}
