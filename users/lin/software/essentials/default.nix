{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        htop
        killall
	unzip
        xorg.xkill
        neofetch
        restic
     ];
}
