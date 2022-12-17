_: {
  homebrew = {
    brews = [
      "kubefwd"
    ];
    casks = [
      "discord"
      "intellij-idea"
      "microsoft-teams"
      "slack"
      "spotify"
      "steam"
    ];
    enable = true;
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
