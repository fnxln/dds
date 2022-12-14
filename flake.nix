{
  description = "D.D.S: Dotfiles Diarreia System";
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
            home.packages = [ pkgs.rust-bin.stable.latest.default ];
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
