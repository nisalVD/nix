{  pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        vim
      ];
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # need to enable this here or it will break
      programs.zsh.enable = true;  # default shell on catalina
      system.stateVersion = 4;
  }

