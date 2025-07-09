# NixOS Beauty - AI Copilot Custom Instructions

## Project Overview
This is a **NixOS Beauty** configuration - a modular, secure, and production-ready NixOS system configuration using Nix Flakes. The project follows declarative infrastructure principles with proper secret management, user isolation, and reproducible environments.

## Core Architecture Principles

### 1. **Modular Design**
- **Separation of Concerns**: Each component has a dedicated module
- **Reusable Components**: Shared modules across different hosts
- **Host-Specific Configurations**: Machine-specific settings isolated in `hosts/`
- **User-Level Isolation**: User configurations managed through Home Manager

### 2. **Security Best Practices (OWASP Aligned)**
- **Secret Management**: Using `sops-nix` with age encryption
- **Principle of Least Privilege**: User groups assigned based on necessity
- **Input Validation**: Flake inputs pinned to specific versions
- **Secure Defaults**: Unfree packages explicitly allowed, experimental features controlled
- **Access Control**: Docker group membership managed explicitly

## Directory Structure & Responsibilities

```
nixos-beauty/
├── .config.nix              # Main configuration: username and system architecture
├── flake.nix                # Flake entrypoint with pinned inputs
├── flake.lock               # Locked dependency versions (DO NOT manually edit)
├── core/                    # Core system modules (shared across hosts)
│   ├── default.nix          # Core module imports
│   ├── programs.nix         # System-wide programs (Firefox, Steam, etc.)
│   ├── system.nix           # System settings (Nix config, hardware)
│   ├── user.nix             # User account definitions
│   ├── timezone.nix         # Timezone configuration
│   ├── internationalization.nix # Locale settings
│   ├── environment.nix      # Environment variables
│   └── docker.nix           # Docker configuration
├── home/                    # Home Manager configurations (user-level)
│   ├── default.nix          # Home Manager entrypoint
│   ├── assets/              # User assets (wallpapers, icons)
│   ├── programs/            # User program configurations
│   └── users/               # User-specific metadata and secrets
├── hosts/                   # Host-specific configurations
│   ├── default.nix          # Host definitions
│   ├── asus-i5/            # Physical machine config
│   └── ss-wsl/             # WSL configuration
└── shells/                  # Development environments
    ├── default.nix          # Shell definitions
    ├── node_*.nix           # Node.js environments
    └── python.nix           # Python environment
```

## Key Configuration Areas

### 1. **User Management** (`core/user.nix`)
- **Available Users**: kyrielle, silvia, leshia, kaluna
- **Group Memberships**: networkmanager, wheel, docker
- **Shell**: zsh (default)
- **Security**: Each user has minimal required permissions

### 2. **Home Manager** (`home/`)
- **User-Level Configurations**: Program settings, dotfiles, themes
- **Asset Management**: Wallpapers, icons, custom scripts
- **Secret Management**: Per-user encrypted secrets via sops
- **Program Modules**: Modular program configurations

### 3. **Host Configurations** (`hosts/`)
- **asus-i5**: Physical desktop/laptop configuration
- **ss-wsl**: Windows Subsystem for Linux setup
- **Modularity**: Each host can have different hardware, network, boot configurations

### 4. **Development Environments** (`shells/`)
- **Isolated Environments**: Node.js (18, 20, 22, 23), Python
- **Reproducible**: Pinned package versions
- **Usage**: `nix develop .#node_23` or `nix develop .#python`

## Security Guidelines

### 1. **Secret Management**
```nix
# Secrets are encrypted with age and managed by sops-nix
sops = {
  age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
  defaultSopsFile = ./users/${username}.secret.yaml;
  secrets = {
    CODE_STATS_API.path = "~/.config/sops-nix/secrets/CODE_STATS_API";
    # ... other secrets
  };
};
```

### 2. **User Isolation**
- Each user has separate secret files
- User-specific configurations in `home/users/`
- Proper group membership management

### 3. **System Hardening**
- Unfree packages explicitly allowed (controlled)
- Experimental features explicitly enabled
- Auto-optimization and garbage collection configured

## Development Guidelines

### 1. **Adding New Users**
```nix
# In core/user.nix
newuser = {
  isNormalUser = true;
  description = "New User";
  extraGroups = ["networkmanager" "wheel"]; # Add docker only if needed
};
```

### 2. **Adding New Programs**
```nix
# Create home/programs/newprogram/default.nix
{ userMetaData, ... }: {
  programs.newprogram = {
    enable = true;
    # Configuration here
  };
}
```

### 3. **Host-Specific Configurations**
```nix
# In hosts/newhost/default.nix
{
  imports = [
    ../../core
    ../../home
    ./hardware-configuration.nix
    ./boot.nix
    # ... other host-specific modules
  ];
}
```

## Maintenance Best Practices

### 1. **Regular Updates**
```bash
# Update flake inputs
nix flake update

# Apply configuration
sudo nixos-rebuild switch --flake .#<host>
```

### 2. **Secret Rotation**
- Rotate age keys periodically
- Update encrypted secrets in `home/users/*.secret.yaml`
- Verify secret access after rotation

### 3. **Cleanup**
```bash
# Garbage collection (configured automatically)
nix-collect-garbage -d

# Store optimization (configured automatically)
nix-store --optimise
```

## Production Deployment

### 1. **Environment Setup**
1. Install NixOS on target machine
2. Clone repository
3. Configure `.config.nix` with appropriate username and system
4. Place age key at `~/.config/sops/age/keys.txt`
5. Run `sudo nixos-rebuild switch --flake .#<host>`

### 2. **Monitoring**
- System logs: `journalctl -f`
- Nix store size: `du -sh /nix/store`
- User processes: `systemctl --user status`

## AI Copilot Guidelines

When working with this codebase:

1. **Always respect the modular structure** - don't mix concerns
2. **Use existing patterns** - follow the established configuration style
3. **Security first** - never hardcode secrets, always use sops-nix
4. **Test changes** - verify configurations before committing
5. **Document modifications** - update relevant documentation
6. **Follow Nix best practices** - use proper attribute sets and imports
7. **Maintain backwards compatibility** - consider existing users and hosts

## Common Tasks

### Adding a New Program
1. Create module in `home/programs/programname/`
2. Add to `home/programs/default.nix` imports
3. Configure user-specific settings if needed
4. Test with `nixos-rebuild switch`

### Adding a New Host
1. Create directory in `hosts/newhost/`
2. Add hardware configuration
3. Create host-specific modules
4. Add to `hosts/default.nix`
5. Test deployment

### Managing Secrets
1. Edit `home/users/username.secret.yaml`
2. Encrypt with sops: `sops home/users/username.secret.yaml`
3. Reference in Home Manager configuration
4. Rebuild and verify access

This configuration prioritizes security, maintainability, and modularity while providing a solid foundation for NixOS deployments across different environments.
