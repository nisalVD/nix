{ pkgs, userSettings, ... }: {


  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    fd
  ];
  imports = [
    ./programs/tmux.nix 
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "tls" = "tmux list-sessions";
      "tks" = "tmux kill-server";
      "v" = "nvim";
      "vi" = "nvim";
      "vim" = "nvim";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "Aloxaf/fzf-tab"; } # Simple plugin installation
      ];
    };
  };

  programs.starship = {
    enable = true;
  };


}
