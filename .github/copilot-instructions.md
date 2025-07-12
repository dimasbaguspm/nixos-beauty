# NixOS Beauty Configuration AI Instructions

This is a modular NixOS configuration using Nix flakes, home-manager, and sops-nix for secrets management.

## Architecture Overview

The configuration follows a 4-layer architecture:
- **`flake.nix`**: Entry point defining inputs (nixpkgs, home-manager, nixvim, sops-nix) and outputs (hosts, dev shells)
- **`hosts/`**: Host-specific configurations that import core + home modules
- **`core/`**: System-level NixOS modules (users, programs, environment, docker)
- **`home/`**: User-specific home-manager configurations (programs, secrets, assets)

## Critical Configuration Pattern

The **`.config.nix`** file is the main config switch - it defines:
```nix
{ username = "kyrielle"; system = "x86_64-linux"; }
```

This drives user selection throughout the system via `inherit (import ../.config.nix) username;`

## User Management System

Each user has two files in `home/users/`:
- **`<username>.metadata.nix`**: Public metadata (git config, account names)
- **`<username>.secret.yaml`**: Encrypted secrets using sops-nix with age key

The `userMetaData` attribute set is passed to all home-manager modules:
```nix
userMetaData = { inherit username; env = import ./users/${username}.metadata.nix; };
```

## Key Development Workflows

### Adding New Hosts
1. Create folder in `hosts/` (copy existing host as template)
2. Add to `hosts/default.nix` with appropriate nixosSystem configuration
3. Deploy: `sudo nixos-rebuild switch --flake .#<hostname>`

### Adding New Users
1. Create `home/users/<username>.metadata.nix` with user-specific vars
2. Create `home/users/<username>.secret.yaml` for encrypted secrets
3. Update `.config.nix` to switch active user

### Fetching GitHub Repository Hashes
When using `pkgs.fetchFromGitHub` in configurations, get the correct SHA hash with:
```bash
nix-shell -p nix-prefetch-github --run "nix-prefetch-github owner repo"
```
This returns JSON with `rev` and `hash` fields needed for fetchFromGitHub.

### Program Configuration Pattern
- All programs in `home/programs/` follow the same structure
- Import pattern: `{ userMetaData, ... }:` to access user-specific data
- Complex programs (like hyprland) split into multiple files with imports
- VSCode extensions use `pkgs.vscode-utils.extensionsFromVscodeMarketplace` for marketplace extensions

## Development Shells
Pre-configured shells in `shells/` for different environments:
- Node versions: `nix develop .#node_23` (also 22, 20, 18)
- Python: `nix develop .#python`
- Each shell includes shellHook with welcome message and tool versions

## Secrets Management
- Age key must be at `~/.config/sops/age/keys.txt`
- Public key: `age192gg8vrrpqum5hq75umj3u2x2xy6pemaxceeh3z2n9f7v308le5s9neams`
- Secrets automatically available in home-manager modules via sops integration

## Visual Customization
- Wallpapers in `home/assets/` with per-user mappings in hyprland config
- Consistent theming across programs using Kanagawa color scheme
- Icon themes and fonts configured globally in program configs

## Common Patterns
- All `.nix` files use `{ imports = [ ... ]; }` pattern for modularity
- `inherit` keyword heavily used for passing variables between scopes
- User-specific customization via `userMetaData` parameter
- System/host separation: core modules for system, home modules for user space
