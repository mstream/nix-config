{
  description = "Mstreams's Nix Environment";

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let system = "x86_64-darwin";
    in {
      darwinConfigurations.macbook = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          home-manager.darwinModule
          ./modules/documentation/default.nix
          ./modules/environment/default.nix
          ./modules/fonts/default.nix
          ./modules/home-manager/default.nix
          ({pkgs, ...}: (import ./modules/nix/default.nix {inherit pkgs; inherit system;}))
          (import ./modules/nixpkgs/default.nix {inherit inputs;})
          ./modules/programs/default.nix
          ./modules/services/default.nix
          ./modules/users/default.nix
        ];
      };
      defaultPackage.x86_64-darwin = self.darwinConfigurations.macbook.system;
    };
}
