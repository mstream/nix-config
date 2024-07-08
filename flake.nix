{
  description = "My Nix MacOS Environment";
  inputs = {
    nix-chad.url = "git+file:../nix-chad?ref=main&shallow=1";
  };

  outputs =
    { nix-chad, ... }:
    let
      config = {
        browser = {
          bookmarks = import ./bookmarks;
          extraExtensions = import ./extra-extensions.nix;
        };
        editor = {
          lineNumbering = "relative";
        };
        extraPackages = import ./extra-packages.nix;
        fontSize = 12;
        gpg = {
          defaultKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
        };
        keyboard = {
          disableKeyRepeat = true;
          remapCapsLock = true;
          remapLeftArrow = true;
        };
        manageWindows = {
          enable = true;
          exclusions = [
            { app = "^Cisco Secure Client$"; }
            {
              app = "^Dialog$";
              title = "^Dialog$";
            }
          ];
        };
        terminal = {
          extraAbbreviations = import ./extra-abbreviations;
          keyBindings = [ ];
          zshInitExtra = "";
        };
        user = {
          homeDirectories = [
            "Development/exercises"
            "Development/presentations"
            "Development/projects/mstream"
            "Development/projects/other"
            "Development/projects/sky-uk"
          ];
          name = "mstream";
        };
      };
    in
    nix-chad.lib.chad config;
}
