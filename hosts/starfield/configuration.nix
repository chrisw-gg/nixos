# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./network.nix
    ./packages.nix
  ];

  # use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable kdump
  # on system crash a backup kernel will be booted to process the error
  boot.crashDump = {
    enable = true;
    reservedMemory = "128M";
  };

  # Load nvidia driver for Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required???
    modesetting.enable = true;
    # Use the NVidia open source kernel module
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    # Enable the Nvidia settings menu, accessible via 'nvidia-settings'
    nvidiaSettings = true;
    
    powerManagement = {
      enable = true;
      finegrained = true;
    };
  }

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

