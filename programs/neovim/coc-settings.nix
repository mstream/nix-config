{ config, ... }:

{
  coc = {
    preferences = {
      colorSupport = true;
      formatOnType = false;
    };
  };
  codeLens = { enable = true; };
  diagnostic = {
    checkCurrentLine = true;
    maxWindowHeight = 12;
    maxWindowWidth = 80;
  };
  dialog = {
    maxHeight = 36;
    maxWidth = 80;
  };
  eslint = { autoFixOnSave = true; };
  java = {
    codeGeneration = { useBlocks = true; };
    completion = {
      enabled = true;
      guessMethodArguments = true;
    };
    configuration = { updateBuildConfiguration = "automatic"; };
    enabled = true;
    format = { enabled = true; };
    implementationsCodeLens = { enabled = true; };
    import = {
      gradle = {
        enabled = true;
        wrapper = { enabled = true; };
      };
    };
    referencesCodeLens = { enabled = true; };
    saveActions = { organizeImports = true; };
    signatureHelp = { enabled = true; };
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
  prettier = {
    bracketSpacing = true;
    eslintIntegration = true;
    printWidth = 72;
    tabWidth = 2;
    semi = true;
    singleQuote = false;
    trailingComma = "all";
    useTabs = false;
  };
  signature = {
    maxWindowHeight = 12;
    maxWindowWidth = 80;
  };
}
