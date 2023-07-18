{ darwin, easy-purescript-nix, flake-utils, homebrew-bundle, homebrew-cask, homebrew-core, home-manager, nix-homebrew, nur, ... }:
let
  inherit (import ../config/default.nix)
    defaultGpgKey
    fontSize
    home-manager-version
    username;
in
flake-utils.lib.eachSystem
  [ "aarch64-darwin" "x86_64-darwin" ]
  (system:
  {
    macbook = darwin.lib.darwinSystem {
      inherit system;
      modules = [
        home-manager.darwinModule
        ../modules/documentation/default.nix
        ../modules/environment/default.nix
        ../modules/fonts/default.nix
        ({ pkgs, ... }: (import ../modules/home-manager/default.nix {
          inherit defaultGpgKey fontSize pkgs username;
          easy-ps = import easy-purescript-nix { inherit pkgs; };
          version = home-manager-version;
        }))
        ../modules/homebrew/default.nix
        ({ pkgs, ... }:
          (import ../modules/nix/default.nix { inherit pkgs system; }))
        (_: import ../modules/nixpkgs/default.nix { inherit nur; })
        ../modules/programs/default.nix
        (_: import ../modules/services/default.nix { })
        (import ../modules/system/default.nix { inherit fontSize; })
        (_: import ../modules/users/default.nix { inherit username; })
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            mutableTaps = false;
            taps = {
              "homebrew/homebrew-bundle" = homebrew-bundle;
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            user = username;
          };
        }
      ];
    };
  }

  )
