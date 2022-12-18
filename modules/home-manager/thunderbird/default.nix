{ pkgs, ... }: {
  enable = true;
  package = pkgs.runCommand "thunderbird-0.0.0" { } "mkdir $out";
  profiles = {
    mstream = {
      isDefault = true;
    };
  };
}
