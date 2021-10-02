{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      adjust_line_height = "100%";
      adjust_column_width = "95%";
      active_border_color = "#00ff00";
      allow_hyperlinks = "yes";
      allow_remote_control = "no";
      background_image = "none";
      background_opacity = "0.9";
      bell_on_tab = "yes";
      clear_all_shortcuts = "yes";
      close_on_child_death = "yes";
      cursor_blink_interval = -1;
      dynamic_background_opacity = "no";
      enable_audio_bell = "no";
      enabled_layouts = "horizontal";
      font_family = "monospace";
      font_size = 18;
      inactive_border_color = "#cccccc";
      inactive_text_alpha = "0.75";
      input_delay = 5;
      kitty_mod = "ctrl+alt";
      macos_hide_from_tasks = "no";
      macos_option_as_alt = "yes";
      macos_thicken_font = "0.75";
      scrollback_lines = 2000;
      single_window_margin_width = -1;
      sync_to_monitor = "yes";
      tab_bar_edge = "top";
      tab_fade = "0.125 0.250 0.375 0.500 0.625 0.750 0.875 1.000";
      visual_bell_duration = "0.25";
      window_alert_on_bell = "yes";
      window_margin_width = 2;
      window_padding_width = 1;
    };
    keybindings = {
      "kitty_mod+w" = "new_window_with_cwd";
      "kitty_mod+q" = "close_window";
      "kitty_mod+[" = "previous_window";
      "kitty_mod+]" = "next_window";
      "kitty_mod+t" = "new_tab";
      "kitty_mod+x" = "close_tab";
      "kitty_mod+<" = "previous_tab";
      "kitty_mod+>" = "next_tab";
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";
      "cmd+c" = "copy_to_clipboard";
      "cmd+v" = "paste_from_clipboard";
    };
  };
}
