{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "starfield";

    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;
      allowedUDPPorts = [
        5353 # mDNS
      ];
      # Open a range of ports to use for locally hosted servers
      allowedTCPPortRanges = [
        { from = 7000; to = 9000; }
      ];
    };

  };

  # mDNS service
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = false;
    publish = {
      enable = true;
      # register mDNS for all local IP addresses
      addresses = true;
    };
  };

}
