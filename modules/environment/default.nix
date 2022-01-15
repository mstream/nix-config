{ pkgs, ... }: {
  environment.variables = {
    EDITOR = "vim";
    PAGER = "bat";
  };
}
