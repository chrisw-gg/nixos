# https://github.com/BirdeeHub/birdeeSystems/blob/a109d8bfa0bdfbfb205cfb196915d1e8f630c7b2/flake.nix#L75
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        # inherit system overlays;
        config.allowUnfree = true;
      };
    in
    {

      # rename hostname to starfield :)
      nixosConfigurations = {
        nyx = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hardware-configuration.nix
          ];
        };
      };

    };
}
