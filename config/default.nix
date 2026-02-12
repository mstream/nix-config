{
  browser = {
    bookmarks = import ./bookmarks;
    extraExtensions = import ./extra-extensions.nix;
  };
  editor = {
    extremeMeasures = true;
    lineNumbering = "relative";
  };
  extraPackages = import ./extra-packages.nix;
  fontSize = 12;
  git = import ./git.nix;
  gpg = {
    defaultKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";
  };
  initialSetup = false;
  keyboard = {
    disableKeyRepeat = true;
    remapCapsLock = true;
    remapLeftArrow = true;
  };
  manageWindows = {
    enable = true;
    exclusions = [
      { app = "^Cisco Secure Client$"; }
      {
        app = "^Dialog$";
        title = "^Dialog$";
      }
    ];
  };
  software = {
    openSourceOnly = true;
  };
  terminal = {
    abbreviations = {
      enable = false;
      extraAbbreviations = import ./extra-abbreviations;
    };
    keyBindings = [ ];
    zshInitExtra = "";
  };
  user = {
    email = "maciej.laciak@gmail.com";
    homeDirectories = [
      "Development/exercises"
      "Development/presentations"
      "Development/projects/mstream"
      "Development/projects/other"
      "Development/projects/sky-uk"
    ];
    name = "mstream";
  };
}
