{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lin";
  home.homeDirectory = "/home/lin";


  imports = [
    ./software/default.nix
  ];

 home.stateVersion = "22.11";



  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # dotfiles configuration
  home.file = {
    ".config/alacritty/alacritty.yml".source = ./dotfiles/alacritty.yml;
    ".config/waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };
    ".config/bin" = {
      source = ./dotfiles/bin;
      recursive = true;
      executable = true;
    };
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;
  };


  nixpkgs.config.allowUnfree = true;
}
