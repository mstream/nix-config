let
  dhallDirectory = {
    name = "Dhall";
    bookmarks = [
      {
        name = "Dhall Built-ins Reference";
        tags = [ "dhall" ];
        url = "https://docs.dhall-lang.org/references/Built-in-types.html";
      }
      {
        name = "Dhall Language Tour";
        tags = [ "dhall" ];
        url = "https://docs.dhall-lang.org/tutorials/Language-Tour.html";
      }
      {
        name = "Dhall Prelude Reference";
        tags = [ "dhall" ];
        url = "https://store.dhall-lang.org/Prelude-v23.0.0/";
      }
    ];
  };

  nixDirectory = {
    name = "Nix";
    bookmarks = [
      {
        name = "Home Manager Manual";
        tags = [
          "home-manager"
          "nix"
        ];
        url = "https://nix-community.github.io/home-manager/";
      }
      {
        name = "Nix Darwin Manual";
        tags = [
          "darwin"
          "nix"
        ];
        url = "https://daiderd.com/nix-darwin/manual/";
      }
      {
        name = "Nix Pills";
        tags = [ "nix" ];
        url = "https://nixos.org/guides/nix-pills/";
      }
      {
        name = "NixOS Search - Packages";
        keyword = "nixpkgs";
        tags = [
          "nix"
          "nixpkgs"
        ];
        url = "https://search.nixos.org/packages";
      }
      {
        name = "Nix User Repositiories";
        keyword = "nur";
        tags = [ "nix" ];
        url = "https://nur.nix-community.org/";
      }
    ];
  };

  pureScriptDirectory = {
    name = "PureScript";
    bookmarks = [
      {
        name = "Purescript by Example";
        tags = [ "purescript" ];
        url = "https://book.purescript.org/";
      }
      {
        name = "Pursuit";
        keyword = "pursuit";
        tags = [ "purescript" ];
        url = "https://pursuit.purescript.org/";
      }
      {
        name = "Purescript: Jordan's Reference";
        tags = [ "purescript" ];
        url = "https://jordanmartinez.github.io/purescript-jordans-reference-site/";
      }
    ];
  };
in
[
  {
    name = "Toolbar";
    toolbar = true;
    bookmarks = [
      {
        name = "GitHub";
        keyword = "github";
        url = "https://github.com/";
      }
    ];
  }
  dhallDirectory
  nixDirectory
  pureScriptDirectory
]
