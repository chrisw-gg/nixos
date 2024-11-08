# nixos


# update flakes
( cd /etc/nixos ; nix flake update )

# update nixos
nixos-rebuild switch
