{ pkgs, ... }: {
  imports = [
    ../programs/karabiner-elements.nix
  ];

  homebrew = {
    global = {
      lockfiles = true;
    };
    enable = true;
    taps = [ "shopify/shopify" ];
    brews = [
      "brotli"
      "sqlite"
      # "shopify-cli"
    ];
    casks = [ ];
    onActivation = {
      cleanup = "uninstall";
    };
  };

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
  system.defaults = {
    dock = {
      autohide = true;
    };
    # keyboard repeat
    NSGlobalDomain = {
      KeyRepeat = 1;
      InitialKeyRepeat = 15;
    };
  };
}
