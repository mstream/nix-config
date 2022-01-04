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
        nodePackages.htmlhint
        nodePackages.prettier
        perl
        ripgrep
        statix
        unixtools.watch
      ];
    };
  };
}
