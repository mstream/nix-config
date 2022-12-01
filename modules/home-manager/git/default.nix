{
  enable = true;
  userName = "mstream";
  userEmail = "maciej.laciak@gmail.com";
  delta = {
    enable = true;
    options = {
      syntax-theme = "GitHub";
      line-numbers = true;
    };
  };
  extraConfig = {
    core = {
      autocrlf = "input";
      editor = "vim";
    };
  };
  ignores = [ ".direnv" ".DS_Store" ];
}
