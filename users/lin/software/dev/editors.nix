{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    vscode
    android-studio
  ];
}
