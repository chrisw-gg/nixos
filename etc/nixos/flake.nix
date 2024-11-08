# https://discourse.nixos.org/t/how-to-include-other-peoples-flakes-in-your-config/34295/2
# This one is a beauty:
# https://github.com/amz-x/dotnix/blob/master/flake.nix
# sudo nixos-rebuild switch --flake ./#AMZ-Linux
# https://www.reddit.com/r/NixOS/comments/1adfw25/using_the_user_environment_variable_in_nix_flake/
{
  description = "Nixos config flake";

  inputs = {
    mydesktops.url = "github:syke-dev/nixos";
  };

  outputs = { self, nixpkgs, mydesktops }@inputs:
    let # mydesktop = import mydesktops;
    in {
      a = "baz";
      c = "bar";
      # mine = mydesktop;
      # nixosConfigurations = mydesktop.outputs( {self=self; nixpkgs=nixpkgs;} );
    };
}
