{ pkgs, ... }:

let 
  easy-ps = import
    (pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "d9a37c75ed361372e1545f6efbc08d819b3c28c8";
      sha256 = "1fklhnddy5pzzbxfyrlprsq1p8b6y9v0awv1a1z0vkwqsd8y68yp";
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
    act
    awscli2
    bash
    blender
    browsh
    cargo
    commitizen
    coreutils
    deno
    docker
    elixir
    elmPackages.elm
    emacs
    kind
    gimp
    gradle
    graphviz
    inkscape
    ipfs
    maven
    mdbook
    mdbook-mermaid
    nerdfonts
    niv
    nodePackages.lerna
    openal
    pandoc
    stack
    unixtools.watch
    vault
    wget
    yarn
    yq
  ] ++ ps-packages;

  imports = [ ./programs ];

  home.file = with pkgs; {
    "Development/jdk/8".source = jdk8_headless;
    "Development/jdk/11".source = jdk11_headless;
    "Development/jdk/16".source = jdk16_headless;
    "Development/node/10".source = nodejs-10_x;
    "Development/node/12".source = nodejs-12_x;
    "Development/node/14".source = nodejs-14_x;
    "Development/node/16".source = nodejs-16_x;
    "Games/minetest".source = minetest;
  };
}
