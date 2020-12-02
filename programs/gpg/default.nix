{ ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      no-auto-key-retrieve = true;
      no-comments = true;
      no-emit-version = true;
      default-key = "AD0E8D746F045AEB5F6436A78EFB89F9D8DA7684";
    };
  };
}
