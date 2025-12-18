let
  skyIdentity = {
    repositoryUrl = "git@github.com:NBCUDTC/**";
    sshKeyPath = "/Users/mstream/.ssh/sky_id_rsa";
    userEmail = "maciej.laciak@sky.uk";
  };
in
{
  alternativeGitIdentities = [
    skyIdentity
  ];
}
