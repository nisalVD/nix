{ pkgs, ... }: {
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fd
    starship
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    plugins = [];
  };

  programs.starship = {
    enable = true;
  };

}
