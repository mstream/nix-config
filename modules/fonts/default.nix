{pkgs, ...}: {
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [ overpass fira ];
  };
}
