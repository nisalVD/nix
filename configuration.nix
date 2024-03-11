{  pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        vim
      ];
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # need to enable this here or it will break

      system.stateVersion = 4;



      # services.kanata = {
      #   keyboards.default.devices = [ ];
      #   enable = true;
      #   keyboards.default.config = ''
      #     (defsrc
      #      grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
      #      tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
      #      caps a    s    d    f    g    h    j    k    l    ;    '    ret
      #      lsft z    x    c    v    b    n    m    ,    .    /    rsft
      #      lctl lmet lalt           spc            ralt rmet rctl)
      #
      #     (deflayer qwerty
      #      grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
      #      tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
      #      @cap a    s    d    f    g    h    j    k    l    ;    '    ret
      #      lsft z    x    c    v    b    n    m    ,    .    /    rsft
      #      lctl lmet lalt           spc            ralt rmet rctl)
      #
      #     (defalias
      #      ;; tap within 100ms for capslk, hold more than 100ms for lctl
      #      cap (tap-hold 100 100 caps lctl))
      #     '';
      # };

  }

