# https://discourse.nixos.org/t/how-to-include-other-peoples-flakes-in-your-config/34295/2
# This one is a beauty:
# https://github.com/amz-x/dotnix/blob/master/flake.nix
# sudo nixos-rebuild switch --flake ./#AMZ-Linux
# https://www.reddit.com/r/NixOS/comments/1adfw25/using_the_user_environment_variable_in_nix_flake/
{
  description = "Nixos config flake";

  inputs = {
    mydesktops.url = "github:syke-dev/nixos";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };


  # Flake outputs
  outputs = inputs @ { self, nixpkgs, mydesktops, nix-flatpak }: let
    mydesktop = import mydesktops;
    in
    {
      self = self;
      nixpkgs = nixpkgs;
      abc = mydesktop;
      nixosConfigurations = mydesktop.outputs( {self=self; nixpkgs=nixpkgs;} );
      #specialArgs = { inherit inputs; };
      #  nixosConfigurations = (
      #  import syke
      #);
      # specialArgs = { inherit inputs; };
      # modules = [ syke ];
      # Nix OS
      #nixosConfigurations = (
        #import syke {
          #inherit (nixpkgs) lib;
          # inherit inputs nixpkgs syke;
       # }
      #);

      # Nix Darwin
      # darwinConfigurations = (
      #   import ./darwin {
      #     inherit (nixpkgs) lib;
      #     inherit inputs nixpkgs home-manager user location darwin;
      #   }
      # );
    };
}
