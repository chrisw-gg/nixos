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
    "com.google.AndroidStudio"          # Android Studio
    "com.jetbrains.Rider"
    "com.parsecgaming.parsec"           # remote desktop
    "com.unity.UnityHub"
    "com.visualstudio.code"
    "dev.vencord.Vesktop"               # alternative discord
    "io.beekeeperstudio.Studio"         # sql editor
    "io.github.shiftey.Desktop"         # GitHub Desktop
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
    adb.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
    };
  };

  # packages are linked in /run/current-system/sw/bin/ to /nix/store
  environment.systemPackages = with pkgs; [
    fastfetch
    lm_sensors

    # (callPackage ./deepcool.nix {})

    # aws
    awscli2
    ssm-session-manager-plugin
    
    # containers
    fluxcd
    kubectl
    podman-tui
    podman-compose

    # networking
    dig
    tcpdump

    # nodejs (corepack node npm npx)
    nodejs_23

    # python
    python3

    # terraform
    terraform
    terragrunt

    # virtualisation
    qemu
    qemu_kvm
    quickemu

    # rust
    cargo
    rustc

    # general software
    bcompare
    gparted
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

