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
        docker
        easy-ps.purs-tidy
        easy-ps.purescript-language-server
        exercism
        ghc
        gradle
        nixfmt
        nodejs
        nodePackages.htmlhint
        nodePackages.prettier
        nodePackages.purty
        perl
        pinentry
        ripgrep
        rnix-lsp
        spago
        stack
        statix
        unixtools.watch
      ];
    };
  };
}
