{home-manager, ...}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  users.users.nisaldon = {
    name = "nisaldon";
    home = "/Users/nisaldon";
  };
  home-manager.users.nisaldon = import ../home.nix;
}
