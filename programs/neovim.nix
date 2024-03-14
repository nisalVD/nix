{ pkgs, lib, config, userName, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    rustup
  ];
  xdg.configFile.nvim.source = ../config/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    vimAlias = true;
    viAlias = true;
  };
}
