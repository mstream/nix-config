{ easy-ps, pkgs, username, ... }:
{
  users = {
    users."${username}" = {
      home = "/Users/${username}";
      name = "${username}";
      packages = with pkgs; [
        awscli
        aws-sam-cli
        bat
        cachix
        colima
        coreutils
        dhall
        docker
        easy-ps.purs
        easy-ps.purs-tidy
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
        pandoc
        perl
        pinentry
        podman
        pwgen
        ripgrep
        spago
        statix
        tectonic
        tree
        unixtools.watch
        yarn
      ];
    };
  };
}
