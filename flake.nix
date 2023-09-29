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
          extraPackages = [ "cowsay" ];
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
            export DOCKER_HOST=tcp://10.47.140.18:2375
          '';
        };
    in
    nix-chad.lib.chad config;
}
