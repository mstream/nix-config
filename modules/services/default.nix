{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      cmd - return : alacritty
      alt + ctrl - h : yabai -m window --focus west
      alt + ctrl - j : yabai -m window --focus south
      alt + ctrl - k : yabai -m window --focus north
      alt + ctrl - l : yabai -m window --focus east
      shift + alt - h : yabai -m window --swap west
      shift + alt - l : yabai -m window --swap east
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      alt + ctrl - 1 : yabai -m space --focus 1
      alt + ctrl - 2 : yabai -m space --focus 2
      alt + ctrl - 3 : yabai -m space --focus 3
      alt + ctrl - 4 : yabai -m space --focus 4
      alt + ctrl - 5 : yabai -m space --focus 5
      alt + ctrl - 6 : yabai -m space --focus 6
      alt + ctrl - 7 : yabai -m space --focus 7
      alt + ctrl - 8 : yabai -m space --focus 8
      alt + ctrl - 9 : yabai -m space --focus 9
    '';
  };
  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = {
      position = "bottom";
      height = 24;
      title = "on";
      spaces = "on";
      power = "on";
      clock = "off";
      clock_icon = "";
      right_shell = "off";
      padding_left = 16;
      padding_right = 16;
      spacing_left = 24;
      spacing_right = 24;
      text_font = ''"VictorMono Nerd Font Mono:Regular:16"'';
      icon_font = ''"VictorMono Nerd Font Mono:Regular:16"'';
      background_color = "0xff2E3440";
      foreground_color = "0xffECEFF4";
      space_icon_color = "0xff81A1C1";
      power_icon_strip = "ﮤ ﮣ";
      space_icon_strip = "1 2 3 4 5 6 7 8 9";
      spaces_for_all_displays = "on";
      display_separator = "on";
      display_separator_icon = "|";
      clock_format = ''"%d/%m/%y %R"'';
      right_shell_icon = " ";
      right_shell_command = "whoami";
    };
  };
  services.yabai = {
    config = {
      active_window_border_color = "0xff00FF00";
      layout = "bsp";
      enableScriptingAddition = true;
      external_bar = "all:32:24";
      auto_balance = "on";
      split_ratio = "0.5";
      window_placement = "second_child";
      window_gap = 8;
      top_padding = 8;
      bottom_padding = 8;
      left_padding = 8;
      right_padding = 8;
      normal_window_border_color = "0xff888888";
      window_shadow = "off";
      window_border = "on";
      window_border_width = 1;
      window_opacity = "on";
      window_opacity_duration = "0.1";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.5";
    };
    enable = true;
    extraConfig = ''
      yabai -m rule --add app='System Preferences' manage=off
      yabai -m rule --add app='Activity Monitor' manage=off
    '';
    package = pkgs.yabai;
  };
}
