{ config, options, lib, pkgs, ...}: {
# TODO: move this to somewhere suitable
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.nisaldon = {
    name = "nisaldon";
    home = "/Users/nisaldon";
  };
}
