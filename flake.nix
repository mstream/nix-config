{
  description = "My Nix MacOS Environment";

  inputs = { nix-chad.url = "git+file:../nix-chad?ref=main&shallow=1"; };

  outputs = { nix-chad, ... }:
    let
      config = {
        browser = { bookmarks = [ ]; };
        extraPackages = pkgs:
          with pkgs; [
            awscli
            aws-sam-cli
            colima
            deno
            dhall
            discord
            docker
            exercism
            ffmpeg
            gimp
            git-crypt
            gradle
            graphviz
            heroku
            inkscape
            jdk
            kubectl
            lua5_4
            maven
            pandoc
            perl
            pwgen
            purescript
            qemu
            slack
            teams
            xmlformat
            xz
            yarn
            zoom-us
          ];
        fontSize = 12;
        gpg = { defaultKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354"; };
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
          abbreviations = { };
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
    in nix-chad.lib.chad config;
}
