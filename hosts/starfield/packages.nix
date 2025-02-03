{ config, lib, pkgs, ... }:

{

  services.flatpak.enable = true;
  services.flatpak.packages = [
    # general
    "com.discordapp.Discord"
    "com.valvesoftware.Steam"
    "org.mozilla.firefox"
    # dev
    "com.axosoft.GitKraken"
    "com.jetbrains.Rider"
    "com.unity.UnityHub"
    "com.visualstudio.code"
    "dev.vencord.Vesktop"            # alternative discord
    "org.gnome.Connections"          # remote desktop
    # system
    "com.github.tchx84.Flatseal"
    "org.gnome.baobab"               # disk usage anyalzyer
    "org.gnome.Logs"
  ];

  # software in nixpkgs
  # packages that are not nix 'native' need to be installed as regular system packages below
  programs = {
    # chrome.enable = true;
    firefox.enable = true;
    git.enable = true;
  };

  # packages are linked in /run/current-system/sw/bin/ to /nix/store
  environment.systemPackages = with pkgs; [
    fastfetch
    gparted

    qemu
    qemu_kvm
    quickemu

    rustc
    cargo

    lm_sensors

    python3
    # (callPackage ./deepcool.nix {})
  ];

  # enable Docker (rootless)
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

}

