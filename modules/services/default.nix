{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      cmd - return : alacritty
      lalt - h : yabai -m window --focus west
      lalt - j : yabai -m window --focus south
      lalt - k : yabai -m window --focus north
      lalt - l : yabai -m window --focus east
      shift + lalt - h : yabai -m window --swap west
      shift + lalt - l : yabai -m window --swap east
      shift + lalt - j : yabai -m window --swap south
      shift + lalt - k : yabai -m window --swap north
      alt - x : yabai -m space --focus recent
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt + ctrl - q : yabai -m space --focus prev
      alt + ctrl - e : yabai -m space --focus next
      shift + alt - x : yabai -m window --space recent
      shift + alt - 1 : yabai -m window --space 1
      shift + alt - 2 : yabai -m window --space 2
      shift + alt - 3 : yabai -m window --space 3
      shift + alt - 4 : yabai -m window --space 4
      shift + alt - 5 : yabai -m window --space 5
      shift + alt - 6 : yabai -m window --space 6
      shift + alt - 7 : yabai -m window --space 7
      shift + alt - 8 : yabai -m window --space 8
      lalt - t : yabai -m window --toggle float;\
                 yabai -m window --grid 4:4:1:1:2:2
      lalt - d : yabai -m window --toggle zoom-parent
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
      right_shell = "off";
      padding_left = 20;
      padding_right = 20;
      spacing_left = 25;
      spacing_right = 25;
      text_font = ''"Menlo:16.0"'';
      icon_font = ''"Menlo:16.0"'';
      background_color = "0xff2E3440";
      foreground_color = "0xffECEFF4";
      space_icon_color = "0xff81A1C1";
      power_icon_strip = " ";
      space_icon_strip = "1 2 3 4 5 6 7 8";
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
      layout = "bsp";
      auto_balance = "on";
      split_ratio = "0.5";
      window_placement = "second_child";
      window_gap = 8;
      top_padding = 8;
      bottom_padding = 32;
      left_padding = 8;
      right_padding = 8;
      window_shadow = "on";
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
