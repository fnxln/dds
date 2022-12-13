{ config, pkgs, ... }:
{
  imports = [
    ./essentials/default.nix
    ./desktop/default.nix
    ./media/default.nix
    ./crypto/default.nix
    ./dev/default.nix
  ];
}
