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
    nssmdns = true;
    openFirewall = false;
    publish = {
      enable = true;
      addresses = true;
    };
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "/root/.cloudflared/homelab.json";
        default = "http_status:404";
      };
    };
  };

}
