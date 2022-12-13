{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    alacritty
    waybar
    mako
    wofi
    bitwarden
    pulsemixer
    swaybg
    pcmanfm
    mpvpaper
  ];
}
