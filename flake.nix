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
        git = {
          alternativeGitIdentities = [
            {
              repositoryPath = "/Users/mstream/Development/projects/sky-uk/spc-kraken/";
              sshKeyPath = "/Users/mstream/.ssh/sky_id_rsa";
              userEmail = "maciej.laciak@sky.uk";
            }
          ];
        };
        gpg = {
          defaultKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
        };
        keyboard = {
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
          extraAbbreviations = { };
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
