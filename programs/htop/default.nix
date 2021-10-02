{ ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      delay = 5;
      enableMouse = false;
      vimMode = true;
    };
  };
}
