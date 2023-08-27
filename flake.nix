{
  description = "ivan's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ...}:
  
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
  	  config.allowUnfree = true;	
    };
    lib = nixpkgs.lib;
  in{
    nixosConfigurations = {
      nixos = lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland; };
        modules = [
          ./nixos/configuration.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.ivan = import ./home-manager/home.nix;
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      };
    };
  };
}
