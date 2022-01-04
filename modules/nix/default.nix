{pkgs, system, ...}: {
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      system = ${system}
      extra-platforms = ${system}
      experimental-features = nix-command flakes
      build-users-group = nixbld
    '';
  };
}
