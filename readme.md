# NixOS Beauty

This repository contains my personal NixOS configuration.

## Directory Structure

```bash
├── core/                          # Core configurations shared between hosts
│   ├── default.nix
│   ├── internationalization.nix
│   ├── programs.nix
│   ├── system.nix
│   ├── timezone.nix
│   └── user.nix
│ 
├── home/                          # Home-manager configurations
│   ├── assets/                    # Images or plain configuration files
│   ├── programs/                  # Home-manager modules for programs
│   └── users/                     # User settings and secret configurations
│ 
├── shells/                        # Built-in development shells
│ 
├── hosts/                         # Host-specific configurations
│ 
├── flake.lock
└── flake.nix                      # Flake configuration
```

## Installation

### Prerequisites

- Nix installed
- NixOS installed
- Private key for the public age key: `age192gg8vrrpqum5hq75umj3u2x2xy6pemaxceeh3z2n9f7v308le5s9neams`

### Steps

1. Clone the repository.
2. Enter the repository.
3. Select the user and update the `username` variable in the `home/default.nix` file.
4. Switch or create the host you want to configure.
5. Run `sudo nixos-rebuild switch --flake .#<host>` to apply the changes.

## Development Shells

### Node Shells

- `nix develop .#node_23`
- `nix develop .#node_22`
- `nix develop .#node_20`
- `nix develop .#node_18`

### Python Shell

- `nix develop .#python`

## Acknowledgements

- [NixOS Beauty](https://github.com/dimasbagus/nixos-beauty)
- [NixOS WSL](https://github.com/nix-community/NixOS-WSL)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Nixvim](https://github.com/nix-community/nixvim)
- [Sops Nix](https://github.com/Mic92/sops-nix)
