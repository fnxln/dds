{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        htop
        killall
        xorg.xkill
        neofetch
        restic
     ];
}