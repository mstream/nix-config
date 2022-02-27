_: {
  homebrew = {
    autoUpdate = true;
    casks = [
      "firefox"
      "discord"
      "spotify"
    ];
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
