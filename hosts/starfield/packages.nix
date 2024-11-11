{ config, lib, pkgs, ... }:

{

  services.flatpak.enable = true;
  services.flatpak.packages = [
    # "org.mozilla.firefox"
    "com.discordapp.Discord"
    "com.valvesoftware.Steam"
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
    gparted

    qemu
    qemu_kvm
    quickemu

    rustc
    cargo
  ];

}

