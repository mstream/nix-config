{
  enable = true;
  settings = {
    background_opacity = 0.95;
    font = { size = 18; };
    key_bindings = [
      {
        key = "H";
        mods = "ALT";
        chars = "\\x1bh";
      }
      {
        key = "J";
        mods = "ALT";
        chars = "\\x1bj";
      }
      {
        key = "K";
        mods = "ALT";
        chars = "\\x1bk";
      }
      {
        key = "L";
        mods = "ALT";
        chars = "\\x1bl";
      }
      {
        key = "Left";
        mods = "ALT";
        chars = "\\x1b\\x62";
      }
      {
        key = "Right";
        mods = "ALT";
        chars = "\\x1b\\x66";
      }
    ];
    shell = {
      program = "/bin/zsh";
      args = [ "-l" "-c" "tmux attach || tmux" ];
    };
    window = {
      decorations = "full";
      startup_mode = "Fullscreen";
    };
  };
}