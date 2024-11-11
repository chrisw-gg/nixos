# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./network.nix
    ./flatpak.nix
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  services = {
    # login screen
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    # desktop environment
    desktopManager.plasma6 = {
      enable = true;
    };

  };
 
  users.users.chris = {
    isNormalUser = true;
    home = "/home/chris";
    extraGroups = ["wheel" "networkmanager"];
  };

  users.users.nebula = {
    isNormalUser = true;
    home = "/home/nebula";
  };

  programs = {
  #  .chrome.enable = true;
    firefox.enable = true;
    git.enable = true;
  };

  # packages are linked in /run/current-system/sw/bin/ to /nix/store
  environment.systemPackages = with pkgs; [
    gparted
    qemu
    qemu_kvm
    quickemu
  ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

