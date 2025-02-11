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

  # mDNS service (hostname.local)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = false;
    publish = {
      enable = true;
      addresses = true;
    };
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "fc96a693-f680-4f9d-bf1e-18ca621797e4.json" = {
        credentialsFile = "/etc/cloudflared/fc96a693-f680-4f9d-bf1e-18ca621797e4.json";
        default = "http_status:404";
      };
    };
  };

}
