{
  description = "Nixos config flake";

  inputs = {
    inputs.sykenixos.url = "https://github.com/syke-dev/nixos";
  };

  outputs = { self, nixpkgs }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import sykenixos;
    in
    {

    };
}