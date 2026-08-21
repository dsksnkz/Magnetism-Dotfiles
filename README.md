# Magnetism Dotfiles

Magnetism is a compact black-and-white desktop configuration for Arch Linux
and Hyprland. It uses tiny 3 px corners, smooth compositor animations, a custom
Quickshell top bar, and a purpose-built Rofi launcher.

## Included dotfiles

- Hyprland, Hyprlock, Hypridle, and Hyprpaper
- Quickshell bar and utility dashboard
- Rofi application, command, and window launcher
- SwayNC notifications
- Kitty, GTK 3/4, Qt6ct, and KDE colors
- btop, CAVA, and Fastfetch
- Magnetism utility scripts and desktop launcher

Waybar is intentionally not included; Quickshell provides the top bar.

## Arch dependencies

The configuration expects these packages or commands:

```text
hyprland hyprlock hypridle hyprpaper quickshell rofi swaync kitty
clipse wl-clipboard hyprpicker grim slurp playerctl brightnessctl
power-profiles-daemon network-manager-applet pavucontrol
```

It also uses JetBrainsMono Nerd Font for icons and launcher text.

## Install carefully

These are personal dotfiles, not a universal installer. Back up your existing
configuration before copying anything. Review `.config/hypr/monitors.conf` and
replace the included `/home/matte` paths with your own home directory first.

Clone the repository, inspect the files, then copy only the components you want
into the matching locations under your home directory.

## Notes

- Designed for Arch Linux, Hyprland, and Wayland.
- The monitor configuration targets `HDMI-A-1` at 1920x1080 120 Hz and disables
  `eDP-1`; change it before use on another machine.
- The included scripts do not require root.
