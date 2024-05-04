{
  description = "My Nix MacOS Environment";

  inputs = { nix-chad.url = "git+file:../nix-chad?ref=main&shallow=1"; };

  outputs = { nix-chad, ... }:
    let
      config = {
        defaultGpgKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
        extraPackages = [
          "awscli"
          "aws-sam-cli"
          "colima"
          "deno"
          "dhall"
          "discord"
          "docker"
          "exercism"
          "ffmpeg"
          "gimp"
          "git-crypt"
          "gradle"
          "graphviz"
          "heroku"
          "inkscape"
          "jdk"
          "kubectl"
          "lua5_4"
          "maven"
          "nodejs"
          "pandoc"
          "perl"
          "pwgen"
          "purescript"
          "qemu"
          "slack"
          "teams"
          "xmlformat"
          "xz"
          "yarn"
          "zoom-us"
        ];
        browserBookmarks = [ ];
        fontSize = 12;
        homeDirectories = [
          "Development/exercises"
          "Development/presentations"
          "Development/projects/mstream"
          "Development/projects/other"
          "Development/projects/sky-uk"
        ];
        manageWindows = true;
        manageWindowsExclusions = [ "Cisco Secure Client" "Dialog" ];
        remapCapsLock = true;
        remapLeftArrow = true;
        username = "mstream";
        enableKeyMapping = false;
        zshInitExtra = "";
      };
    in nix-chad.lib.chad config;
}
