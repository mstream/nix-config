{ ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
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
