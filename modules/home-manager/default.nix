{ pkgs, ... }:
let
  userConfig = username: {
    home.file.ownProjects = {
      recursive = true;
      target = "Development/projects/${username}/.keep";
      text = "";
    };

    home.file.skyProjects = {
      recursive = true;
      target = "Development/projects/sky-uk/.keep";
      text = "";
    };

    home.file.otherProjects = {
      recursive = true;
      target = "Development/projects/other/.keep";
      text = "";
    };

    programs = {
      alacritty = import ./alacritty/default.nix;
      bat = import ./bat/default.nix;
      firefox = (import ./firefox/default.nix { inherit pkgs; });
      git = import ./git/default.nix;
      gpg = import ./gpg/default.nix;
      jq = import ./jq/default.nix;
      neovim = (import ./neovim/default.nix { inherit pkgs; });
      password-store = import ./password-store/default.nix;
      tmux = import ./tmux/default.nix;
      zsh = import ./zsh/default.nix;
    };
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users.mstream = userConfig "mstream";
}
