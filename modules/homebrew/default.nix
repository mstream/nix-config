_: {
  homebrew = {
    autoUpdate = true;
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
      "widelands"
    ];
    cleanup = "zap";
    enable = true;
    extraConfig = ''
      cask "firefox", args: { language: "en-GB" }
    '';
    global = {
      brewfile = true;
      noLock = true;
    };
    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "txn2/tap"
    ];
  };
}
