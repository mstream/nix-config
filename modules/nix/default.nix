{ pkgs, system, ... }: {
  nix = {
    binaryCachePublicKeys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
    ];
    binaryCaches = [
      "https://hydra.iohk.io "
      "https://nixcache.reflex-frp.org"
    ];
    package = pkgs.nix;
    extraOptions = ''
      system = ${system}
      extra-platforms = ${system}
      experimental-features = nix-command flakes
      build-users-group = nixbld
    '';
  };
}
