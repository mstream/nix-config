{ easy-ps, pkgs, ... }:
{
  users = {
    nix.configureBuildUsers = true;
    users.mstream = {
      home = "/Users/mstream";
      name = "mstream";
      packages = with pkgs; [
        awscli
        aws-sam-cli
        bat
        cachix
        dhall
        dhall-lsp-server
        docker
        easy-ps.purs
        easy-ps.purs-tidy
        easy-ps.purescript-language-server
        exercism
        gradle
        jdk11
        kubectl
        nixfmt
        nodejs
        nodePackages.htmlhint
        nodePackages.prettier
        nodePackages.purty
        perl
        pinentry
        podman
        ripgrep
        rnix-lsp
        spago
        statix
        unixtools.watch
      ];
    };
  };
}
