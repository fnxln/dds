{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    lutris
    wine-staging
    parsec-bin
  ];
}
