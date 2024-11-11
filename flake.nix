# https://github.com/BirdeeHub/birdeeSystems/blob/a109d8bfa0bdfbfb205cfb196915d1e8f630c7b2/flake.nix#L75
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, nix-flatpak }:
    let
      pkgs = import nixpkgs {
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.starfield = nixpkgs.lib.nixosSystem {
          system = "x86_x64-linux";
          modules = [
            # auto pulls in flatpaks defined via services.flatpak.packages
            nix-flatpak.nixosModules.nix-flatpak

            ./hosts/starfield/configuration.nix
          ];
        };

    };
}
