{ pkgs, ... }: {

  users = {
    nix.configureBuildUsers = true;
    users.mstream = {
      home = "/Users/mstream";
      name = "mstream";
      packages = with pkgs; [
        bat
        dhall
        fzf
        nixfmt
        nodejs
        nodePackages.htmlhint
        nodePackages.prettier
        nodePackages.purty
        perl
        ripgrep
        statix
        unixtools.watch
      ];
    };
  };
}
