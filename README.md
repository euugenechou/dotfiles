# dotfiles

This may have been a big mistake.

```bash
# Get nix first.
sh <(curl -L https://nixos.org/nix/install)

# Flakes are too bleeding edge.
export NIX_CONFIG="experimental-features = nix-command flakes"

# Bootstrap `home-manager`, then let it cook.
nix shell nixpkgs#home-manager
home-manager switch --flake .#username@hostname
```
