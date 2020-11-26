{ config, ... }:

{
  diagnostic = { 
    checkCurrentLine = true;
  };
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
    vim = {
      command = "vim-language-server";
      args = [ "stdio" ];
      filetypes = [ "vim" ];
};
  };
}
