{ pkgs, ... }:

{
  enable = true;
  initExtra = ". /Users/mstream/.nix-profile/etc/profile.d/nix.sh";
  prezto = {
    enable = true;
  };
}
