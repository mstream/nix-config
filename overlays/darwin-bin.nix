self: { fetchurl, stdenv, undmg, ... }:

{
  firefox-darwin-bin = stdenv.mkDerivation rec {
    pname = "Firefox";
    version = "91.6.0esr";

    buildInputs = [ undmg ];
    sourceRoot = ".";
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Firefox.app "$out/Applications/Firefox.app"
    '';

    src = fetchurl {
      name = "Firefox-${version}.dmg";
      url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
      sha256 = "1iswyigrjgv4hicl5h70jc44wl0mk8vwyvajjw2798ydjiqn9zrj";
    };
    /*
      meta = with stdenv.lib; {
      description = "The Firefox web browser";
      homepage = "https://www.mozilla.org/en-GB/firefox";
      maintainers = [ maintainers.mstream ];
      platforms = platforms.darwin;
      };
    */
  };
}
