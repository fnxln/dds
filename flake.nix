{
  description = "D.D.S: Dotfiles Diarreia System";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, hyprland, ... }@ inputs:
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
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
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