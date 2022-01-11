{ pkgs, ... }: {

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users.mstream.programs = {
    alacritty = {
      enable = true;
      settings = {
        background_opacity = 0.95;
        font = { size = 18; };
        key_bindings = [
          {
            key = "H";
            mods = "ALT";
            chars = "\\x1bh";
          }
          {
            key = "J";
            mods = "ALT";
            chars = "\\x1bj";
          }
          {
            key = "K";
            mods = "ALT";
            chars = "\\x1bk";
          }
          {
            key = "L";
            mods = "ALT";
            chars = "\\x1bl";
          }
          {
            key = "Left";
            mods = "ALT";
            chars = "\\x1b\\x62";
          }
          {
            key = "Right";
            mods = "ALT";
            chars = "\\x1b\\x66";
          }
        ];
        shell = {
          program = "/bin/zsh";
          args = [ "-l" "-c" "tmux attach || tmux" ];
        };
        window = {
          decorations = "full";
          startup_mode = "Fullscreen";
        };
      };
    };
    bat = {
      enable = true;
      config = { theme = "GitHub"; };
    };
    firefox = {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons;
        [ ublock-origin ];
      package = pkgs.runCommand "firefox-0.0.0" { } "mkdir $out";
    };
    git = {
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
      ignores = [ ".envrc" ".DS_Store" ];
    };
    gpg = {
      enable = true;
      settings = {
        no-auto-key-retrieve = true;
        no-comments = true;
        no-emit-version = true;
        default-key = "AD0E8D746F045AEB5F6436A78EFB89F9D8DA7684";
      };
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraConfig = builtins.readFile ./init.vim;
      plugins = with pkgs.vimPlugins; [
        ale
        deoplete-nvim
        fzf-vim
        gruvbox
        idris2-vim
        vim-polyglot
      ];
    };
    password-store = { enable = true; };
    tmux = {
      baseIndex = 1;
      clock24 = true;
      enable = true;
      extraConfig = ''
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        set -s escape-time 0
      '';
      keyMode = "vi";
      prefix = "'C-Space'";
    };
    zsh = {
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
    };
  };
}
