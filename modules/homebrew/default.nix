_: {
  homebrew = {
    autoUpdate = true;
    brews = [
      "colima"
    ];
    casks = [
      "firefox"
      "discord"
      "microsoft-teams"
      "slack"
      "spotify"
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
    ];
  };
}
