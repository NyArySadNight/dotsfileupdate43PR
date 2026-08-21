# StealNateOS Rice — an upgrade of 43PR/dotfiles

This dotfiles setup keeps **100% of the original keybinds and workflow** from
[43PR/dotfiles](https://github.com/43PR/dotfiles), while adding a substantial
layer of effects, modules, and configurability on top.

## What's kept unchanged
- All original keybinds: `$mod+T/D/E/B/F/Q`, waybar toggle, floating trick,
  wallpaper cycle, screenshot, clipboard (`$mod+V`).
- The "simple, readable rice" philosophy — no unnecessary bloat.

## What's upgraded

| Category | Original (43PR) | StealNateOS version |
|---|---|---|
| Lock screen | basic `swaylock` | `hyprlock` with blur, live clock, avatar |
| Idle/power | none | `hypridle`: lock at 5', DPMS off at 5'30", suspend at 15' |
| Animation | Hyprland defaults | 6 custom beziers, per-layer animations (windows/layers/workspaces/border) |
| Blur | not configured | multi-pass blur (4 passes) + vibrancy, dedicated layer rules for waybar/rofi/wlogout |
| Waybar | empty folder | full config: CPU/RAM/temp/network/battery/tray + custom power button, Catppuccin style |
| Rofi | empty folder | rounded theme, blurred background |
| Window rules | none | dedicated gaming rules (immediate/noanim to preserve FPS), PiP, dev apps |
| Volume/brightness OSD | none | smooth `swayosd`, no stutter |
| Screenshot | saved to file | added a bind to copy directly to clipboard |
| Wallpaper | unclear script | `hyprpaper` + a complete cycle script with state tracking |

## Structure
```
dotfiles/
├── hypr/
│   ├── hyprland.conf      # main entrypoint
│   ├── env.conf           # environment variables + autostart
│   ├── keybinds.conf      # all keybinds (original + new)
│   ├── windowrules.conf   # window rules & layer rules
│   ├── monitors.conf      # monitor setup (adjust to your machine)
│   ├── hypridle.conf
│   ├── hyprlock.conf
│   ├── hyprpaper.conf
│   └── scripts/wallpaper-cycle.sh
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── rofi/
│   └── config.rasi
├── wlogout/
│   ├── layout
│   └── style.css
└── kitty/
    └── kitty.conf
```

## Installation
```bash
# required packages (example for Arch/CachyOS)
sudo pacman -S hyprland hypridle hyprlock hyprpaper waybar rofi-wayland \
    wlogout kitty swayosd cliphist grim slurp wl-clipboard \
    ttf-jetbrains-mono-nerd papirus-icon-theme

# copy dotfiles into ~/.config
cp -r dotfiles/hypr    ~/.config/
cp -r dotfiles/waybar  ~/.config/
cp -r dotfiles/rofi    ~/.config/
cp -r dotfiles/wlogout ~/.config/
mkdir -p ~/.config/kitty && cp dotfiles/kitty/kitty.conf ~/.config/kitty/

# add your own wallpapers
mkdir -p ~/.config/hypr/wallpapers
```

Then adjust `hypr/monitors.conf` to your actual display, and change
`$browser` in `env.conf` if you don't use zen-browser.

## Next steps (for going even further)
- Add `matugen` so wallpapers auto-generate a color palette → sync waybar/rofi/kitty to the background image.
- Add `quickshell` in place of waybar for more complex widgets (weather, to-do lists).
- Fold these themes into `archiso/airootfs/etc/skel` in StealNateOS so new
  users get this rice out of the box on first login.
