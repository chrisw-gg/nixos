{ config, lib, pkgs, ... }:

{

  # display manager == login screen
  services.displayManager = {
    defaultSession = "plasma";
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # KDE plasma desktop environment
  services.desktopManager.plasma6 = {
    enable = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users = {

    chris = {
      isNormalUser = true;
      home = "/home/chris";
      extraGroups = ["wheel" "networkmanager"];
    };

    nebula = {
      isNormalUser = true;
      home = "/home/nebula";
    };

  };

}

