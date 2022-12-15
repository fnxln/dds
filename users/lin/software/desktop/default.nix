{ config, pkgs, ... }:
{
  imports = [
    ./gaming.nix
    ./utils.nix
    # ./hypr.nix
  ];
  home.packages = with pkgs; [
    nerdfonts
    arc-theme
    firefox
    glib
    slurp
    xdg-desktop-portal-wlr
    xdg-desktop-portal
    tdesktop
  ];
}
