_: {
  homebrew = {
    brews = [
      "colima"
      "coreutils"
      "kubefwd"
    ];
    casks = [
      "discord"
      "docker"
      "firefox"
      "gimp"
      "inkscape"
      "intellij-idea"
      "microsoft-teams"
      "slack"
      "spotify"
      "steam"
      "vlc"
    ];
    enable = true;
    extraConfig = ''
      cask "firefox", args: { language: "en-GB" }
    '';
    global = {
      brewfile = true;
      lockfiles = false;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "txn2/tap"
    ];
  };
}
