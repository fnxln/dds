{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    neovide
    vscode
    android-studio
  ];
}
