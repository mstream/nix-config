{pkgs, ...}: {
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [ fira nerdfonts overpass ];
  };
}
