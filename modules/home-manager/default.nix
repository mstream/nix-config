{ defaultGpgKey, fontSize, pkgs, username, ... }:
let
  nvchad = pkgs.callPackage ../../packages/nvchad {};

  userConfig = username: {
    home.stateVersion = "22.11";

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

    home.file.gnupgGpgAgent = {
      recursive = true;
      target = ".gnupg/gpg-agent.conf";
      text = ''
        enable-ssh-support
        default-cache-ttl 60
        max-cache-ttl 120
      '';
    };

    home.file.gnupgSshControl = {
      recursive = true;
      target = ".gnupg/sshcontrol";
      text = ''
        ${defaultGpgKey}
      '';
    };

    home.packages = with pkgs; [];

    xdg.configFile."nvim" = {
      source = "${nvchad}";
    };

    programs = {
      alacritty = import ./alacritty/default.nix { inherit fontSize; };
      bat = import ./bat/default.nix;
      browserpass = import ./browserpass/default.nix;
      direnv = import ./direnv/default.nix;
      firefox = (import ./firefox/default.nix { inherit fontSize pkgs username; });
      git = (import ./git/default.nix { inherit username; });
      gpg = (import ./gpg/default.nix { inherit defaultGpgKey; });
      jq = import ./jq/default.nix;
      neovim = (import ./neovim/default.nix { inherit pkgs; });
      password-store = import ./password-store/default.nix;
      thunderbird = (import ./thunderbird/default.nix { inherit pkgs username; });
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

  home-manager.users."${username}" = userConfig username;
}
