{ config, lib, pkgs, ... }:

{

  # use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable kdump
  # on system crash a backup kernel will be booted to process the error
  options.boot.crashDump = {
    enable = true;
    reservedMemory = "128M";
  };

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

}

