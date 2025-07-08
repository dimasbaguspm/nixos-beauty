# Hyprland Desktop Color Palette

This document contains the color palette used across the Hyprland desktop configuration, extracted from the Waybar configuration and other components.

## Primary Colors

### Background Colors
- **Transparent Background**: `transparent`
- **Main Background**: `rgba(0, 0, 8, .7)` - Very dark blue with transparency
- **Hover Background**: `rgba(26, 27, 38, 0.9)` - Dark gray with high opacity
- **Active Workspace**: `#13131d` - Very dark purple
- **Workspace Hover**: `#11111b` - Slightly lighter dark purple

### Text Colors
- **Primary Text**: `#c0caf5` - Light blue-gray (main text color)
- **Hover Text**: `#cdd6f4` - Slightly lighter blue-gray
- **Accent Blue**: `#1793d1` - Bright blue (NixOS logo hover)
- **Warning/Power**: `#f7768e` - Coral red (logout button)

### Special Effects
- **Power Button Hover**: `rgba(247, 118, 142, 0.2)` - Coral red with low opacity

## Color Usage Guide

### Backgrounds
- Use `rgba(0, 0, 8, .7)` for main panel backgrounds
- Use `rgba(26, 27, 38, 0.9)` for hover states
- Use `transparent` for the main window background

### Text and Icons
- Use `#c0caf5` for primary text and icons
- Use `#cdd6f4` for hover text states
- Use `#f7768e` for warning/power-related elements
- Use `#1793d1` for accent elements (like logos)

### Interactive Elements
- Active workspaces: `#13131d`
- Hover workspaces: `#11111b`
- Button hover backgrounds: `rgba(26, 27, 38, 0.9)`

## Typography
- **Font Family**: "CaskaydiaCove Nerd Font", sans-serif
- **Base Font Size**: 12px
- **Logo Font Size**: 16px

## Border Radius
- **Standard Radius**: 12px
- **Circular Elements**: 9999px (for power button)

## Transitions
- **Standard Transition**: `background-color .3s ease-out`
- **Window Transition**: `.5s`
- **Logo Color Transition**: `.5s`

## Notes
This color scheme appears to be based on a dark theme with blue-purple undertones, providing good contrast and readability while maintaining a modern aesthetic. The colors work well together to create a cohesive desktop environment.