{ pkgs, lib, config, userName, ... }:

with lib;
let cfg = config.modules.karabiner-elements;
in {
  options.modules.karabiner-elements = {
    enable = mkEnableOption "karabiner-elements";
  };
  config = mkIf cfg.enable {
    services.karabiner-elements.enable = true;
    home-manager.users.${userName}.home = {
      file.karabiner-elements = {
        target = ".config/karabiner/karabiner.json";
        text = lib.strings.fileContents
          ../config/karabiner-elements/karabiner.json;
      };
    };
  };
}

