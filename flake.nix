{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };

  hosts = {
    "Nisals-MacBook-Pro-2" = {
      userSettings = {
        tmuxProjectPath = "/Users/nisaldon/code/convert";
      };
    };
  };

  in
  {
    darwinConfigurations."Nisals-MacBook-Pro-2" = nix-darwin.lib.darwinSystem {
      # Set Git commit hash for darwin-version.
      modules = [ 
        configuration
        ./configuration.nix 
        home-manager.darwinModules.home-manager 
        ./darwin/base.nix
        ./darwin/hosts/Nisals-MacBook-Pro-2/home.nix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nisaldon = import ./home.nix;
          home-manager.extraSpecialArgs = {
            userSettings = hosts."Nisals-MacBook-Pro-2".userSettings; 
          };
        }
      ];
      specialArgs = { 
        userSettings = hosts."Nisals-MacBook-Pro-2".userSettings; 
      };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Nisals-MacBook-Pro-2".pkgs;
  };
}
