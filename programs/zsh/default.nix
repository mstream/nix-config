{ ... }:

let
  zshrc = builtins.readFile ./zshrc;
  initExtra = ''
    . /Users/mstream/.nix-profile/etc/profile.d/nix.sh
  '' + zshrc;

in {
  programs.zsh = {
    inherit initExtra;
    enable = true;
    prezto = {
      color = true;
      enable = true;
    };
  };
}
