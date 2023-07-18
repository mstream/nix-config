{
  # An ID of a key to be used for GPG signing by default.
  # This is expected to be different for individuals.
  # The key is not part of this repository and has to be provided
  # manually. 
  defaultGpgKey = "BE318F09150F6CB0724FFEC0319EE1D7FC029354";

  # A desired font size in tools that have a mean to set it fixed. 
  fontSize = 24;

  # This should be manually adjusted to match the home-manager's 
  # flake release revision frome the flake.nix inputs section.
  home-manager-version = "23.05";

  # This should be set to the desired user name.
  username = "mstream";
}
