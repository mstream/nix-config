{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      adjust_line_height = "100%";
      adjust_column_width = "95%";
      allow_hyperlinks = "yes";
      allow_remote_control = "no";
      background_image = "none";
      background_opacity = "0.95";
      bell_on_tab = "yes";
      close_on_child_death = "yes";
      cursor_blink_interval = -1;
      dynamic_background_opacity = "no";
      enable_audio_bell = "no";
      enabled_layouts = "horizontal";
      font_family = "monospace";
      font_size = 18;
      input_delay = 5;
      macos_hide_from_tasks = "no";
      macos_option_as_alt = "yes";
      macos_thicken_font = "0.5";
      scrollback_lines = 2000;
      sync_to_monitor = "yes";
      tab_bar_edge = "top";
      tab_fade = "0.125 0.250 0.375 0.500 0.625 0.750 0.875 1.000";
      visual_bell_duration = "0.25";
      window_alert_on_bell = "yes";
    };
    keybindings = {
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";
      "kitty_mod+enter" = "new_window_with_cwd";
    };
  };
}
