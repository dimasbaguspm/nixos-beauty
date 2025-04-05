# NixOS Beauty

This is a flake that contains my personal NixOS configuration

## Directory structure

```bash
├── core/                          # core configurations that are shared between hosts
│   ├── default.nix
│   ├── internationalization.nix
│   ├── programs.nix
│   ├── system.nix
│   ├── timezone.nix
│   └── user.nix
│ 
├── home/                          # home-manager configurations
│   ├── assets/                    # where the images or plain config are stored
│   ├── programs/                  # home manager modules programs
│   └── users/                     # user settings and secrets configurations
│ 
├── shells/                        # place where the builtin dev shells are live
│ 
├── hosts/
│ 
├── .config.nix                    # central config to decide which user and system to use
├── .sops.yaml                     # setup encryption for secrets
├── flake.lock
└── flake.nix                      # flake configuration
```

## Installation

### Prerequisites

- Nix installed
- NixOS installed
- Private key for this public age key (`age192gg8vrrpqum5hq75umj3u2x2xy6pemaxceeh3z2n9f7v308le5s9neams`)

### Steps

1. Clone the repository
2. Enter the repository
3. Select the user and amend the `username` variable in the `home/default.nix` file
4. Switch or create the host you want to configure
5. Run `sudo nixos-rebuild switch --flake .#<host>` to apply the changes

## Development Shells

Currently only node dev shells are supported
It's mandatory to run the following command before running the dev shell

```bash
nix develop .#node # to run the node shell
nix develop .#python # to run the python shell
```

## Acknowledgements

- [NixOS Beauty](https://github.com/dimasbagus/nixos-beauty)
- [NixOS WSL](https://github.com/nix-community/NixOS-WSL)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Nixvim](https://github.com/nix-community/nixvim)
- [Sops Nix](https://github.com/Mic92/sops-nix)
