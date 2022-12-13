{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    neovide
    vscode
    
  ];
  programs = {
    emacs = {
          enable = false;
          package = pkgs.emacs-nox;
        };
  };
}
