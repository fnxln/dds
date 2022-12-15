{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    obs-studio
    yt-dlp
    mpv
    spotify
    spicetify-cli
  ];
}
