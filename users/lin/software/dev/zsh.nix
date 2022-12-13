{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
  ];
  programs.zsh = {
    enable = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins = [ "fzf" "python" "git"];
    };
  };
}
