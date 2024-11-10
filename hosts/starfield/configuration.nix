# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nyx";
  networking.networkmanager.enable = true;

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

    #flatpak {
    #  enable = true;
    #  packages = [
    #    "com.discordapp.Discord"
    #  ];
    #};

  };
 
  users.users.chris = {
    isNormalUser = true;
    home = "/home/chris";
    extraGroups = ["wheel" "networkmanager"];
    initialPassword = "hunter2";
  };

  # Any packages that do not have a standard nix install (see programs below)
  #environment.systemPackages = [
  #  pkgs.discord
  #];

  programs = {
  #  .chrome.enable = true;
    firefox.enable = true;
    git.enable = true;
  };

  #services.flatpak.packages = [
  #  { appId = "com.brave.Browser"; origin = "flathub"; }
  #  { appId = "com.discordapp.Discord"; }
  #];

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

