{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
  ];
  programs.zsh = {
    enable = true;
    shellAliases = {
      neovide = "env -u WAYLAND_DISPLAY neovide";
    };
    initExtra = 
    "
source $HOME/.config/bin/setvars.sh
    ";
    autocd = true;
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins = [ "fzf" "python" "git"];
    };
  };
}
