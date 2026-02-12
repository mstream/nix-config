{
  description = "My Nix MacOS Environment";
  inputs = {
    nix-chad.url = "git+file:../nix-chad?ref=next-5&shallow=1";
  };
  outputs = { nix-chad, ... }: nix-chad.lib.chad (import ./config);
}
