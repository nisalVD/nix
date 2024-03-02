{ pkgs, ... }: {
  programs.zsh.enable = true;
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    hello
  ];

  # The state version is required and should stay at the version you
  # originally installed.
}
