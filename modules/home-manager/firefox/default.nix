{ pkgs, ... }: {
  enable = true;
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    browserpass
    privacy-badger
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
      id = 0;
      isDefault = true;
      name = "mstream";
      settings = {
        "app.update.auto" = false;
        "app.update.download.promptMaxAttempts" = 0;
        "app.update.elevation.promptMaxAttempts" = 0;
        "browser.newtabpage.enabled" = false;
        "browser.startup.homepage" = "https://google.com";
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.socialtracking.annotate.enabled" = true;
        "services.sync.declinedEngines" = "addons,passwords,prefs";
        "services.sync.engine.addons" = false;
        "services.sync.engineStatusChanged.addons" = true;
        "services.sync.engine.passwords" = false;
        "services.sync.engine.prefs" = false;
        "services.sync.engineStatusChanged.prefs" = true;
        "signon.rememberSignons" = false;
      };
    };
  };
}
