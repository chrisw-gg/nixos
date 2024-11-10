{ config, lib, pkgs, ... }:

{
  networking.hostName = "starfield";
  networking.networkmanager.enable = true;
}

