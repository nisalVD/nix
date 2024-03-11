{  pkgs, ... }: {
  imports = [
    ../programs/karabiner-elements.nix
  ];

  modules = {
    karabiner-elements = {
      enable = true;
    };
  };

  programs.zsh = {
    enable = true;
    promptInit = ""; # Disable default Darwin prompt
  };
  security.pam.enableSudoTouchIdAuth = true;
}
