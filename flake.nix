{
  description = "D.D.S: Dotfiles Diarreia System";
  nixConfig = {
    extra-substituters = "https://cache.nixos.org https://nix-community.cachix.org https://hyprland.cachix.org";
    extra-trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=";
    extra-experimental-features = "nix-command flakes";
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs = { nixpkgs, home-manager, hyprland, emacs-overlay, rust-overlay, ... }@ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in
    {

      homeConfigurations.lin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./users/lin/home.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default emacs-overlay.overlay ];
            home.packages = [ pkgs.rust-bin.stable.latest.default pkgs.emacsPgtk ];
          })
        ];

      };
      nixosConfigurations = {
        diarreia = nixpkgs.lib.nixosSystem {
          modules = [
            hyprland.nixosModules.default
            ./system/configuration.nix
            {
              programs.hyprland = {
                enable = true;
              };

            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };

}
