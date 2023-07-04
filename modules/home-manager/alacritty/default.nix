{ fontSize, ... }:
{
  enable = true;
  settings = {
    font = {
      size = fontSize;
      normal.family = "VictorMono Nerd Font Mono";
      normal.style = "Medium";
      bold.family = "VictorMono Nerd Font Mono";
      bold.style = "Bold";
      italic.family = "VictorMono Nerd Font Mono";
      italic.style = "Italic";
    };
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
      program = "zsh";
      args = [ "-l" "-c" "tmux attach || tmux" ];
    };
    window = {
      decorations = "full";
      dynamic_padding = true;
      opacity = 0.95;
      scrolling = {
        history = 0;
      };
      startup_mode = "Windowed";
    };
  };
}
