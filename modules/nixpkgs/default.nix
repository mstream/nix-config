{inputs, ...}: {
  nixpkgs = {
    config = {
      allowBroken = false;
      allowUnfree = false;
    };
    overlays = with inputs; [ nur.overlay ];
  };
}
