{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    electrum
    monero-gui
    bisq-desktop
  ];
}
