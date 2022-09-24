{ pkgs, system, ... }: {
  nix = {
    configureBuildUsers = true;
    extraOptions = ''
      system = ${system}
      extra-platforms = ${system}
      experimental-features = nix-command flakes
      build-users-group = nixbld
    '';
    package = pkgs.nix;
    settings = {
      substituters = [
        "https://hydra.iohk.io "
      ];
      trusted-public-keys = [
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
    };
  };
}
