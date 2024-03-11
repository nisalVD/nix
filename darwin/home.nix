{ pkgs, userSettings, ... }:
let
  raycast = pkgs.raycast.overrideAttrs (oldAttrs: rec {
    version = "1.69.0"; # Replace with the desired version
    src = pkgs.fetchurl {
      name = "Raycast.dmg";
      url = "https://releases.raycast.com/releases/1.69.0/download?build=universal";
      hash = "sha256-Kc9S1K7VQ8swNFxwpZKT80g1RrD1M0L25nIGcHjZoDI=";
    };
  });
in
{
  home.packages = with pkgs; [
    raycast
  ];

}
