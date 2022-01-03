{ pkgs, ... }:

let 
  easy-ps = import
    (pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "13ace3addf14dd9e93af9132e4799b7badfbe99e";
      sha256 = "1gva113kyygjhn9i92vg6cyj15vhyfhq7haq51cvp4xdz4j0q4xn";
    }) {
    inherit pkgs;
  };

  ps-packages = with easy-ps; [
    psa
    pscid
    purescript-language-server 
    purs
    purs-tidy
    spago
  ];

in {
  home.username = "mstream";
  home.homeDirectory = "/Users/mstream";

  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    PAGER = "less";
    SHELL = "zsh";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    bash
    browsh
    coreutils
    docker
    emacs
    kind
    gimp
    unixtools.watch
    wget
    yq
  ] ++ ps-packages;

  imports = [ 
    ./programs 
    ./services
  ];

  home.file = with pkgs; {
    "Development/jdk/8".source = jdk8_headless;
    "Development/jdk/11".source = jdk11_headless;
    "Development/node/12".source = nodejs-12_x;
    "Development/node/14".source = nodejs-14_x;
    "Development/node/16".source = nodejs-16_x;
    "Games/minetest".source = minetest;
  };
}
