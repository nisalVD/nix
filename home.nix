{ pkgs, ... }: {
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fd
    fzf
  ];


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
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

  imports = [
    ./programs/tmux.nix
  ];

}
