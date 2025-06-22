# NixOS Beauty

This repository contains my personal NixOS configuration, designed to be modular, and reproducible

## Directory Structure

```bash
├── core/        # Core system modules shared between hosts (users, system, environment, etc)
├── home/        # Home-manager configs (user programs, assets, user secrets)
├── shells/      # Prebuilt development shells (Node, Python, etc)
├── hosts/       # Host-specific configs (for each machine or WSL)
├── flake.lock   # Flake lock file (auto-generated)
├── flake.nix    # Flake entrypoint
├── .config.nix  # Main config: set your username and system here
```

## Quick Start

### Prerequisites
- **Nix** and **NixOS** installed ([Install Guide](https://nixos.org/download.html))
- Your private key for the provided age public key (for secrets):
  `age192gg8vrrpqum5hq75umj3u2x2xy6pemaxceeh3z2n9f7v308le5s9neams`

### 1. Clone the Repository
```sh
git clone https://github.com/dimasbaguspm/nixos-beauty.git
cd nixos-beauty
```

### 2. Set Your Username
Edit `.config.nix` and set the `username` variable to your user (see available users in `home/users/`). Example:
```nix
username = "kyrielle";
```

### 3. Pick or Create a Host
- See available hosts in `hosts/` (e.g. `asus-i5`, `ss-wsl`).
- To use a host, run:
  ```sh
  sudo nixos-rebuild switch --flake .#asus-i5
  ```
- To add a new host, copy an existing folder in `hosts/` and adjust as needed.

### 4. Apply Your Configuration
- After setting your username and picking a host, run:
  ```sh
  sudo nixos-rebuild switch --flake .#<host>
  ```
  Replace `<host>` with your chosen host name.

### 5. (Optional) Use Development Shells
- Enter a dev shell for Node or Python:
  ```sh
  nix develop .#node_23   # or node_22, node_20, node_18
  nix develop .#python
  ```
- These provide isolated environments with the right tools preinstalled.

## Tips & Troubleshooting
- **Secrets**: Place your age key at `~/.config/sops/age/keys.txt` for secrets decryption.
- **User Metadata**: User-specific info (git/email/etc) is in `home/users/<username>.metadata.nix`.
- **Program Configs**: Home-manager modules for each program are in `home/programs/`.
- **Rebuild**: If you change `.config.nix` or user/host configs, rerun the `nixos-rebuild` command.
- **Problems?** Check the [NixOS manual](https://nixos.org/manual/nixos/stable/) or open an issue.

## Acknowledgements
- [NixOS Beauty](https://github.com/dimasbagus/nixos-beauty)
- [NixOS WSL](https://github.com/nix-community/NixOS-WSL)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Nixvim](https://github.com/nix-community/nixvim)
- [Sops Nix](https://github.com/Mic92/sops-nix)
