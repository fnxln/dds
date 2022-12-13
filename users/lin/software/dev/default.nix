{ config, pkgs, ... }:
{
  imports = [
    ./editors.nix
    ./utils.nix
    ./zsh.nix
  ];
}
