{ config, lib, pkgs, ... }:

{
  services.flatpak.enable = true;

  services.flatpak.packages = [
    # "org.mozilla.firefox"
    "com.discordapp.Discord"
    "com.valvesoftware.Steam"
  ];
}

