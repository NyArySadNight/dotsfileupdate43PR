#!/usr/bin/env bash
# Chuyển wallpaper tuần tự trong thư mục ~/.config/hypr/wallpapers
# Cách dùng: wallpaper-cycle.sh [next|prev]

WALL_DIR="$HOME/.config/hypr/wallpapers"
STATE_FILE="/tmp/.wallpaper-idx"
mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | sort)

[ ${#WALLS[@]} -eq 0 ] && exit 1

idx=$(cat "$STATE_FILE" 2>/dev/null || echo 0)

if [ "$1" = "prev" ]; then
    idx=$(( (idx - 1 + ${#WALLS[@]}) % ${#WALLS[@]} ))
else
    idx=$(( (idx + 1) % ${#WALLS[@]} ))
fi

echo "$idx" > "$STATE_FILE"
NEW_WALL="${WALLS[$idx]}"

hyprctl hyprpaper preload "$NEW_WALL"
hyprctl hyprpaper wallpaper ",$NEW_WALL"
