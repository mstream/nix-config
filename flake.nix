{
  description = "Mstreams's Nix Environment";

  inputs = {
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    easy-purescript-nix = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/23.05";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, darwin, flake-utils, home-manager, easy-purescript-nix, nur, ... }@inputs:
    let
      defaultGpgKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
      fontSize = 24;
    in
    {
      darwinConfigurations =
        flake-utils.lib.eachSystem [ "aarch64-darwin" "x86_64-darwin" ]
          (system:
            {
              macbook = darwin.lib.darwinSystem {
                inherit system;
                modules = [
                  (_: { nixpkgs.overlays = [ 
                          nur.overlay 
                          (final: prev: {nvchad = prev.callPackage ../packages/nvchad {};}) 
                        ]; 
                      }
                  )
                  home-manager.darwinModule
                  ./modules/documentation/default.nix
                  ./modules/environment/default.nix
                  ./modules/fonts/default.nix
                  ({ pkgs, ... }: (import ./modules/home-manager/default.nix { inherit defaultGpgKey fontSize pkgs; }))
                  ./modules/homebrew/default.nix
                  ({ pkgs, ... }: (import ./modules/nix/default.nix { inherit pkgs system; }))
                  (import ./modules/nixpkgs/default.nix { inherit inputs; })
                  ./modules/programs/default.nix
                  ({ pkgs, ... }: (import ./modules/services/default.nix { }))
                  (import ./modules/system/default.nix { inherit fontSize; })
                  ({ pkgs, ... }: (import ./modules/users/default.nix {
                    inherit pkgs;
                    easy-ps = import easy-purescript-nix { inherit pkgs; };
                  })
                  )
                ];
              };
            }
          );
    };
}
