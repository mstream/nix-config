_: {
  homebrew = {
    brews = [
      "kubefwd"
    ];
    casks = [
      "discord"
      "docker"
      "firefox"
      "google-chrome"
      "inkscape"
      "intellij-idea"
      "microsoft-teams"
      "slack"
      "spotify"
      "steam"
      "thunderbird"
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
