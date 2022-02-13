{
  autocd = false;
  enable = true;
  enableSyntaxHighlighting = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  initExtra = builtins.readFile ./zshrc;
  prezto = {
    autosuggestions.color = "fg=blue";
    caseSensitive = false;
    color = true;
    editor = {
      dotExpansion = true;
      keymap = "vi";
      promptContext = true;
    };
    enable = true;
    historySubstring = {
      foundColor = "fg=blue";
      notFoundColor = "fg=red";
    };
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
      # showReturnVal = "true";
      theme = "sorin";
    };
  };
}
