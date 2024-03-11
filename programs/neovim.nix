{ pkgs, lib, config, userName, ... }:
{
  xdg.configFile.nvim.source = ../config/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    viAlias = true;
  };
}
