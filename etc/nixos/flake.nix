{
  description = "Nixos config flake";

  inputs = {
    mydesktops.url = "github:syke-dev/nixos";
  };

  outputs = { self, mydesktops }@inputs:
    let mydesktop = import mydesktops;
    in {
      a = "baz";
      c = "bar";
      # mine = mydesktop;
      liba       = nixpkgs.lib;
      nixosConfigurations = mydesktop.outputs( {self=self; } );
    };
}
