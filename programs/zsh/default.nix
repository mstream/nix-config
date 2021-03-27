{ ... }:

let
  initExtra = ''
    source /Users/mstream/.nix-profile/etc/profile.d/nix.sh
  '' + (builtins.readFile ./zshrc);

in {
  programs.zsh = {
    inherit initExtra;
    enable = true;
    enableCompletion = true;
    prezto = {
      color = true;
      enable = true;
    };
  };
}
