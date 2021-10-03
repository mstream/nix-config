{ ... }:

{
  programs.tmux = {
    baseIndex = 1;
    clock24 = true;
    enable = true;
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R
      set -s escape-time 0
    '';
    keyMode = "vi";
    prefix = "'C-\\'";
  };
}
