
{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
    nodejs
    python3.pkgs.pip
    python3.pkgs.wcwidth
    yarn
  ];
}
