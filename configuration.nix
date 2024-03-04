{  pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        vim
      ];
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      system.stateVersion = 4;
  }

