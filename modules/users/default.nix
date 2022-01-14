{ easy-ps, pkgs, ... }: {

  users = {
    nix.configureBuildUsers = true;
    users.mstream = {
      home = "/Users/mstream";
      name = "mstream";
      packages = with pkgs; [
        bat
        cachix
        dhall
        dhall-lsp-server
        easy-ps.purs-tidy
        easy-ps.purescript-language-server
        nixfmt
        nodejs
        nodePackages.htmlhint
        nodePackages.prettier
        nodePackages.purty
        perl
        purescript
        ripgrep
        rnix-lsp
        spago
        statix
        unixtools.watch
      ];
    };
  };
}
