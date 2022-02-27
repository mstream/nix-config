{ pkgs, ... }: {
  enable = true;
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    browserpass
    ublock-origin
    vimium
  ];
  package = pkgs.runCommand "firefox-0.0.0" { } "mkdir $out";
  profiles = {
    mstream = {
      bookmarks = {
        comGithub = {
          keyword = "github";
          name = "GitHub";
          url = "https://github.com";
        };
        orgNixosSearch = {
          keyword = "nixos";
          name = "NixOS Search";
          url = "https://search.nixos.org";
        };
        orgPurescriptPursuit = {
          keyword = "pursuit";
          name = "Pursuit";
          url = "https://pursuit.purescript.org/";
        };
      };
      isDefault = true;
      name = "mstream";
    };
  };
}
