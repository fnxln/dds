{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lin";
  home.homeDirectory = "/home/lin";


  imports = [
    ./software/default.nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";



  gtk = {
    enable = true;
    theme = {
      name = "Arc-Dark";
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
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;
  };


  nixpkgs.config.allowUnfree = true;
  # Local Package
}
