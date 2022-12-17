{ config, pkgs, ... }:
{
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
    ".config/wofi" = {
      source = ./dotfiles/wofi;
      recursive = true;
    };
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;
    ".local/share/nvim/site/pack/packer/start/packer.nvim".source = fetchGit {
      url = "https://github.com/wbthomason/packer.nvim";
      submodules = true;
      rev = "64ae65fea395d8dc461e3884688f340dd43950ba";
    };
  };

}