{  pkgs, ... }: {
  programs.zsh = {
    enable = true;
    promptInit = ""; # Disable default Darwin prompt
  };
  security.pam.enableSudoTouchIdAuth = true;

# keybaord
  system.keyboard.enableKeyMapping = true;

}
