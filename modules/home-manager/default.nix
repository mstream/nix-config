{ pkgs, ... }: {

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users.mstream.programs = {
    alacritty = import ./alacritty/default.nix;
    bat = import ./bat/default.nix;
    firefox = (import ./firefox/default.nix { inherit pkgs; });
    git = import ./git/default.nix;
    gpg = import ./gpg/default.nix;
    neovim = (import ./neovim/default.nix { inherit pkgs; });
    password-store = import ./password-store/default.nix;
    tmux = import ./tmux/default.nix;
    zsh = import ./zsh/default.nix;
  };
}
