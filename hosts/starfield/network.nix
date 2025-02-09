{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "starfield";

    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        # Open a range of ports to use for locally hosted servers
        { from = 7000; to = 9000; }
      ];
    };

  };

}
