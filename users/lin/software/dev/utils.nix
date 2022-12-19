{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    nixpkgs-fmt
    nil
    nodejs
    python3.pkgs.pip
    flutter
    stylua
    python3.pkgs.wcwidth
    clang
    yarn
  ];
}
