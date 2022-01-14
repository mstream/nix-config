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
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, darwin, home-manager, easy-purescript-nix, ... }@inputs:
    let system = "x86_64-darwin";
    in
    {
      darwinConfigurations.macbook = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          home-manager.darwinModule
          ./modules/documentation/default.nix
          ./modules/environment/default.nix
          ./modules/fonts/default.nix
          ./modules/home-manager/default.nix
          ({ pkgs, ... }: (import ./modules/nix/default.nix { inherit pkgs; inherit system; }))
          (import ./modules/nixpkgs/default.nix { inherit inputs; })
          ./modules/programs/default.nix
          ./modules/services/default.nix
          ./modules/system/default.nix
          ({ pkgs, ... }: (import ./modules/users/default.nix {
            inherit pkgs;
            easy-ps = import easy-purescript-nix { inherit pkgs; };
          })
          )
        ];
      };
      defaultPackage.x86_64-darwin = self.darwinConfigurations.macbook.system;
    };
}
