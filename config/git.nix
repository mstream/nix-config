let
  skyRepo = repoName: {
    repositoryPath = "/Users/mstream/Development/projects/sky-uk/${repoName}/";
    sshKeyPath = "/Users/mstream/.ssh/sky_id_rsa";
    userEmail = "maciej.laciak@sky.uk";
  };
in
{
  alternativeGitIdentities = [
    (skyRepo "dpe-platform-config")
    (skyRepo "spc-kraken")
    (skyRepo "spc-ovp-ssi")
  ];
}
