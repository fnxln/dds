{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    alacritty
    mako
    wofi
    bitwarden
    pulsemixer
    swaybg
    pcmanfm
    mpvpaper
    imv
    virt-manager
  ];
}
