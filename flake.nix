# https://github.com/BirdeeHub/birdeeSystems/blob/a109d8bfa0bdfbfb205cfb196915d1e8f630c7b2/flake.nix#L75
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs:
    let
      # Linux Architecture
      # System Options: [ "aarch64-linux" "x86_64-linux" ]
      system    = "x86_64-linux";
      hostname  = "nyx";
      pkgs      = import nixpkgs { inherit system; config.allowUnfree = true; };
      lib       = nixpkgs.lib;
    in
    {
      # rename hostname to starfield :)
      nixosConfigurations.nyx = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
        };

    };
}
