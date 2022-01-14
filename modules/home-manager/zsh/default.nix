{
  enable = true;
  enableCompletion = true;
  initExtra = builtins.readFile ./zshrc;
  prezto = {
    color = true;
    editor = {
      keymap = "vi";
      promptContext = true;
    };
    enable = true;
    pmodules = [
      "environment"
      "terminal"
      "editor"
      "history"
      "directory"
      "spectrum"
      "utility"
      "osx"
      "completion"
      "prompt"
      "syntax-highlighting"
      "history-substring-search"
      "autosuggestions"
      "ssh"
      "command-not-found"
      "git"
      "node"
      "docker"
    ];
    prompt = {
      pwdLength = "short";
      theme = "sorin";
    };
  };
}
