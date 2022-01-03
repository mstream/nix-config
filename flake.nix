{
  description = "Mstream's darwin system";

  inputs = {
    darwin.url = "github:lnl7/nix-darwin/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."Mstreams-MacBook" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ ./configuration.nix ];
    };
  };
}
