{
  description = "wevtimoteo's NixOS configuration with Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix # Base configuration
          ./configuration.nix          # Custom modular configuration
        ];
      };
    };

    homeConfigurations = {
      wevtimoteo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./home/zsh.nix
          ./home/antidote.nix
          ./home/gpg.nix
        ];
      };
    };
  };
}
