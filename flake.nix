{
  description = "My Nix MacOS Environment";

  inputs = {
    nix-chad.url = "git+file:../nix-chad?ref=main&shallow=1";
  };

  outputs = { nix-chad, ... }:
    let
      config =
        {
          defaultGpgKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
          extraCasks = [
            "steam"
            "vlc"
          ];
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
          firefoxBookmarks =
            [
              {
                name = "Toolbar Bookmarks";
                toolbar = true;
                bookmarks = [
                  {
                    name = "Nix";
                    bookmarks = [
                      {
                        name = "homepage";
                        tags = [ "nix" ];
                        url = "https://nixos.org/";
                      }
                      {
                        name = "wiki";
                        tags = [ "wiki" "nix" ];
                        url = "https://nixos.wiki/";
                      }
                      {
                        keyword = "nixos";
                        tags = [ "nix" "search" "packages" ];
                        name = "NixOS Search";
                        url = "https://search.nixos.org";
                      }
                    ];
                  }
                  {
                    name = "PureScript";
                    bookmarks = [
                      {
                        keyword = "pursuit";
                        name = "Pursuit";
                        tags = [ "purescript" ];
                        url = "https://pursuit.purescript.org/";
                      }
                    ];
                  }
                  {
                    keyword = "github";
                    name = "GitHub";
                    url = "https://github.com";
                  }
                  {
                    name = "wikipedia";
                    tags = [ "wiki" ];
                    keyword = "wiki";
                    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
                  }
                  {
                    name = "kernel.org";
                    url = "https://www.kernel.org";
                  }
                ];
              }


            ];
          fontSize = 12;
          homeDirectories = [
            "Development/exercises"
            "Development/presentations"
            "Development/projects/mstream"
            "Development/projects/other"
            "Development/projects/sky-uk"
          ];
          manageHomebrew = true;
          username = "mstream";
          zshInitExtra = ''
          '';
        };
    in
    nix-chad.lib.chad config;
}
