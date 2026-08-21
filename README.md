# StealNateOS Rice — nâng cấp từ 43PR/dotfiles

Bộ dotfiles này giữ **100% keybind và luồng thao tác gốc** của
[43PR/dotfiles](https://github.com/43PR/dotfiles), đồng thời bổ sung một tầng
đáng kể về hiệu ứng, module và khả năng cấu hình.

## Những gì được giữ nguyên
- Toàn bộ keybind gốc: `$mod+T/D/E/B/F/Q`, toggle waybar, floating trick,
  wallpaper cycle, screenshot, clipboard (`$mod+V`).
- Triết lý "rice đơn giản, dễ đọc" — không đưa vào thứ không cần thiết.

## Những gì được nâng cấp

| Hạng mục | Bản gốc (43PR) | Bản StealNateOS |
|---|---|---|
| Lock screen | `swaylock` cơ bản | `hyprlock` kính mờ, đồng hồ động, avatar |
| Idle/power | không có | `hypridle`: khóa 5', DPMS 5'30", suspend 15' |
| Animation | mặc định Hyprland | 6 bezier riêng, animation theo lớp (windows/layers/workspaces/border) |
| Blur | không cấu hình | blur đa lớp (4 passes) + vibrancy, layer rule riêng cho waybar/rofi/wlogout |
| Waybar | thư mục trống | config đầy đủ: CPU/RAM/nhiệt độ/mạng/pin/tray + custom power, style Catppuccin |
| Rofi | thư mục trống | theme bo góc, blur, tiếng Việt |
| Window rules | không có | rule riêng cho gaming (immediate/noanim để giữ FPS), PiP, dev apps |
| OSD âm lượng/độ sáng | không có | `swayosd` mượt, không giật |
| Screenshot | lưu file | thêm bind copy trực tiếp vào clipboard |
| Wallpaper | script không rõ | `hyprpaper` + script cycle hoàn chỉnh, có state |

## Cấu trúc
```
dotfiles/
├── hypr/
│   ├── hyprland.conf      # entrypoint chính
│   ├── env.conf           # biến môi trường + autostart
│   ├── keybinds.conf      # toàn bộ keybind (gốc + mới)
│   ├── windowrules.conf   # window rules & layer rules
│   ├── monitors.conf      # cấu hình màn hình (chỉnh theo máy bạn)
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

## Cài đặt
```bash
# gói cần thiết (ví dụ trên Arch/CachyOS)
sudo pacman -S hyprland hypridle hyprlock hyprpaper waybar rofi-wayland \
    wlogout kitty swayosd cliphist grim slurp wl-clipboard \
    ttf-jetbrains-mono-nerd papirus-icon-theme

# copy dotfiles vào ~/.config
cp -r dotfiles/hypr    ~/.config/
cp -r dotfiles/waybar  ~/.config/
cp -r dotfiles/rofi    ~/.config/
cp -r dotfiles/wlogout ~/.config/
mkdir -p ~/.config/kitty && cp dotfiles/kitty/kitty.conf ~/.config/kitty/

# thêm wallpaper của bạn vào
mkdir -p ~/.config/hypr/wallpapers
```

Sau đó chỉnh `hypr/monitors.conf` theo màn hình thật, và đổi `$browser` trong
`env.conf` nếu bạn không dùng zen-browser.

## Bước tiếp theo (nếu muốn "đột phá" thêm)
- Thêm `matugen` để wallpaper tự sinh bảng màu → đồng bộ waybar/rofi/kitty theo ảnh nền.
- Thêm `quickshell` thay waybar nếu muốn widget phức tạp hơn (weather, to-do).
- Ghép các theme này vào skel dotfiles trong `archiso/airootfs/etc/skel` của
  StealNateOS để user mới có sẵn rice này ngay lần đăng nhập đầu.
