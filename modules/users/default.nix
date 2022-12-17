{ easy-ps, pkgs, ... }:
{
  users = {
    users.mstream = {
      home = "/Users/mstream";
      name = "mstream";
      packages = with pkgs; [
        awscli
        aws-sam-cli
        bat
        cachix
        colima
        coreutils
        dhall
        dhall-lsp-server
        docker
        easy-ps.purs
        easy-ps.purs-tidy
        easy-ps.purescript-language-server
        exercism
        ffmpeg
        inkscape
        gimp
        git-crypt
        gradle
        heroku
        jdk11
        kubectl
        lua5_4
        mplayer
        nixfmt
        nmap
        nodejs
        nodePackages.htmlhint
        nodePackages.prettier
        nodePackages.purty
        nodePackages.typescript
        nodePackages.typescript-language-server
        pandoc
        perl
        pinentry
        podman
        ripgrep
        rnix-lsp
        spago
        statix
        tectonic
        tree
        unixtools.watch
      ];
    };
  };
}
