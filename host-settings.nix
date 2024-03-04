{ config, options, lib, pkgs, ...}: {
  options = {
    userSettings = {
      tmuxProjectPath = lib.mkOption {
        type = lib.types.string;
        default = "/Users/nisaldon/personal";
      };
    };
  };
}
