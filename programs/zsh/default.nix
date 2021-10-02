{ ... }:

let
  initExtra = ''
    source /Users/mstream/.nix-profile/etc/profile.d/nix.sh
  '' + (builtins.readFile ./zshrc);

in {
  programs.zsh = {
    inherit initExtra;
    enable = true;
    enableCompletion = true;
    prezto = {
      color = true;
      editor = {
        keymap = "emacs";
        promptContext = true;
      };
      enable = true;
      pmodules = [
          "environment"
          "terminal"
          "editor"
          "history"
          "directory"
          "spectrum"
          "utility"
          "completion"
          "prompt"
          "syntax-highlighting"
          "ssh"
          "command-not-found"
          "git"
          "node"
          "docker"
      ];
      prompt = {
        pwdLength = "short";
        theme = "sorin";
      };
    };
  };
}
