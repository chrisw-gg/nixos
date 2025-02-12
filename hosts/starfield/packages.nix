{ config, lib, pkgs, ... }:

{

  services.flatpak.enable = true;
  services.flatpak.packages = [
    # general
    "org.chromium.Chromium"
    "com.discordapp.Discord"
    "com.valvesoftware.Steam"
    "org.mozilla.firefox"
    # dev
    "com.axosoft.GitKraken"
    "com.jetbrains.Rider"
    "com.parsecgaming.parsec"           # remote desktop
    "com.unity.UnityHub"
    "com.visualstudio.code"
    "dev.vencord.Vesktop"               # alternative discord
    "io.beekeeperstudio.Studio"         # sql editor
    "io.podman_desktop.PodmanDesktop"
    "org.gnome.Connections"             # remote desktop
    # system
    "com.github.tchx84.Flatseal"
    "org.gnome.baobab"                  # disk usage anyalzyer
    "org.gnome.Logs"
  ];

  # software in nixpkgs
  # packages that are not nix 'native' need to be installed as regular system packages below
  programs = {
    git.enable = true;
  };

  # packages are linked in /run/current-system/sw/bin/ to /nix/store
  environment.systemPackages = with pkgs; [
    fastfetch
    gparted
    lm_sensors

    # (callPackage ./deepcool.nix {})
    awscli2

    # containers
    podman-tui
    podman-compose

    # networking
    dig
    tcpdump

    # node
    npm

    # python
    python3

    # virtualisation
    qemu
    qemu_kvm
    quickemu

    # rust
    cargo
    rustc

  ];

  virtualisation = {
    # Enable common container config files in /etc/containers
    containers.enable = true; 

    podman = {
      enable = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

}

