{ config, ... }:

{
  languageserver = {
    dhall = {
      command = "dhall-lsp-server";
      filetypes = [ "dhall" ];
    };
  };
}
