{ pkgs, defaultGpgKey, ... }:
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

    xdg.configFile.nvim = {
      source = ../../dotfiles/nvim;
      recursive = true;
    };

    programs = {
      alacritty = import ./alacritty/default.nix;
      bat = import ./bat/default.nix;
      firefox = (import ./firefox/default.nix { inherit pkgs; });
      git = import ./git/default.nix;
      gpg = (import ./gpg/default.nix { inherit defaultGpgKey; });
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
