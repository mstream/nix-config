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

  outputs = inputs:
    {
      darwinConfigurations = import ./lib/mk-darwin-config.nix inputs;
    };
}
