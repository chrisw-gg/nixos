{ config, lib, pkgs, fetchFromGitHub, rustPlatform, ... }:

rustPlatform.buildRustPackage rec {
  pname = "deepcool";
  version = "v0.5.2-alpha";

  src = fetchFromGitHub {
    owner = "Nortank12";
    repo = "deepcool-digital-linux";
    rev = "v0.5.2-alpha";
    # hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
  };

  # cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";
  cargoHash = lib.fakeHash;

  meta = {
    description = "DeepCool digital display controller";
    homepage = "https://github.com/Nortank12/deepcool-digital-linux";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };

}

