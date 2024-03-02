{ pkgs, ... }: {
  programs.zsh.enable = true;
  home.stateVersion = "24.05";

  # The state version is required and should stay at the version you
  # originally installed.
}
