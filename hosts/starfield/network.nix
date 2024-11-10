{ config, lib, pkgs, ... }:

{
  networking.hostName = "nyx";
  networking.networkmanager.enable = true;
}

