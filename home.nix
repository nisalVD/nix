{ pkgs, userSettings, ... }:
{
  imports = [
    ./programs/tmux.nix
    ./programs/wezterm.nix
    ./programs/neovim.nix
    ./darwin/home.nix
  ];
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fd
    nodejs_21
    yarn
  ];

  programs.direnv = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "ls" = "ls --color=auto";
      "tls" = "tmux list-sessions";
      "tks" = "tmux kill-server";
      "v" = "nvim";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1";
          sha256 = "sha256-5vQodWvw9akVvvmpVQH0KjdWmCP7vQz2QOK4Yn24MbA=";
        };
      }
      {
        name = "prompt-pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.23.0";
          sha256 = "sha256-BmQO4xqd/3QnpLUitD2obVxL0UulpboT8jGNEh4ri8k=";
        };
      }
    ];
    initExtra = ''
      autoload -U promptinit; promptinit
      prompt pure
    '';
  };

}
