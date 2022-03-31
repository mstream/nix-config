{ pkgs, ... }: {
  fonts = {
    enableFontDir = true;
    #fontDir = { enable = true; };
    fonts = with pkgs; [ nerdfonts ];
  };
}
