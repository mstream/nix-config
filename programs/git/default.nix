{ ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      commit = { template = ".commit-msg-template"; };
      core = {
        autocrlf = "input";
        editor = "vim";
      };
      user = {
        email = "maciej.laciak@gmail.com";
        name = "mstream";
      };
    };
  };
}
