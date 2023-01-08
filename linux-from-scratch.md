# Arch linux from scratch

An opinionated Linux install guide adapted from
[https://wiki.archlinux.org/title/installation_guide](https://wiki.archlinux.org/title/installation_guide)
mostly just for me so I don't forget how to do it.

## Installation

Boot from the live USB.

### Partitions

Use `fdisk -l` and `fdisk /dev/device` to help with creating the following:

| Label | Mount Point | Partition Type       | Size   |
| ----- | ----------- | -------------------- | ------ |
| root  | /           | EXT4                 | --     |
| boot  | /boot       | EFI System Partition | > 512M |
| home  | /home       | EXT4                 | --     |
| swap  | --          | Linux Swap           | --     |

Then:

```sh
mkfs.ext4 /dev/<root-partition>
e2label /dev/<root-partition> root # Optional, sets a label
mount /dev/<root-partition> /mnt
```

```sh
mkfs.ext4 /dev/<home-partition>
mkdir /mnt/home
e2label /dev/<home-partition> home # Optional, sets a label
mount /dev/<home-partition> /mnt/home
```

```sh
swaplabel -L swap /dev/<swap-partition> # Optional, sets a label
swapon /dev/<swap-partition>
```

```sh
mkfs.fat -F 32 /dev/<boot-partition>
fatlabel /dev/<boot-partition> boot # Optional, sets a label
mount /dev/<boot-partition> /mnt/boot
```

### Install Base Packages

```sh
pacstrap /mnt base grub linux-zen neovim networkmanager nvidia-dkms opendoas
```

### Install Window Manager and Basic Apps

```sh
pacstrap /mnt alacritty dmenu feh firefox i3-gaps picom xclip xorg xorg-xinit
# I might have forgotten a couple x packages here
```

_See [dmenu](#dmenu) section for a customized version._

## Configuring the New Install

Tell the new install how to mount partitions. We mounted everything already from
thhe live installer, so we can just copy that over.

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

```sh
arch-chroot /mnt
```

### Set the clock

```sh
ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime   # Doxxed  (!)
hwclock --systohc
```

### Set the locale

Uncomment the following:

```
/etc/locale.gen
-------------------------------------------------------------------------------
en_US.UTF-8 UTF-8
```

Then run:

```sh
locale-gen
```

And create this file:

```
/etc/locale.conf
-------------------------------------------------------------------------------
LANG=en_US.UTF-8
```

### Set the hostname

```
/etc/hostname
-------------------------------------------------------------------------------
<hostname>
```

### Uhhhh, idk what this does but you have to do it.

```sh
mkinitcpio -P
```

### Set a Root Password

```sh
passwd
```

### [Configure GRUB](https://wiki.archlinux.org/title/GRUB#Installation) (make sure you chrooted)

```sh
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## You should now be able to boot.

That's most of the system-level things and by now, you should be able to reboot into Arch.

### Window Manager & Compositor

```
cp /etc/xdg/picom.conf ~/.config/picom.conf
```

```
cp /etc/i3/config ~/.config/i3/config
```

```
~/.xinitrc
-------------------------------------------------------------------------------
export TERMINAL="alacritty"

picom &

# feh --fill-bg <path/to/img> &

exec i3
```

### Key Repeat Speed

```
~/.xinitrc
-------------------------------------------------------------------------------
xset r rate 150 50
```

### DPI adjustment: on 4K displays, you may want to include BOTH of the following:

```
~/.Xresources
-------------------------------------------------------------------------------
Xft.dpi: 144
```

```
~/.xinitrc
-------------------------------------------------------------------------------
xrandr --dpi 144
xrdb ~/.Xresources
```

### Fonts

Move the fonts in `fonts/` to `~/.local/share/fonts/<font-name>/` and make sure
`~/.config/fontconfig/fonts.conf` is installed.

### Sound

Sound can be done with PulseAudio, but that's just more unnecessary bloat.
Configure Alsa (builtin kernel module) with the following:

```
~/.asoundrc
-------------------------------------------------------------------------------
defaults.pcm.card 1
defaults.ctl.card 1
defaults.pcm.device 8
```

As far as I can tell:

- defaults.pcm.card sets the card to ouput to
- defaults.ctl.card sets the card that gets controlled by `alsamixer`.
- defaults.pcm.device sets the device on the card to output through
  - Ex: Nvidia card, outputting to the 2nd HDMI port

Use:

- `aplay -Ll` to list cards and devices
- `alsamixer` to unmute channels and set volume
- `speaker-test` to test output

## Useful Packages

```sh
pacman -S vlc pantheon-files qbittorrent git liquidctl ripgrep tmux which zsh
```

```sh
yay -S windscribe-cli github-cli
```

### yay

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
cd ..
rm -rf yay-bin
```

### NetworkManager

```sh
doas systemctl enable NetworkManager.service
doas systemctl start NetworkManager.service
```

### dmenu

A pre-patched version that I think is cool is avalible.

```sh
git clone https://www.github.com/cjcarrick/dmenu
```

### liquidctl

```
/etc/sustemd/system/liquidctl-silent.service
-------------------------------------------------------------------------------
[Unit]
Description=AIO startup service

[Service]
Type=oneshot
ExecStartPre=/bin/sleep 5
ExecStart=liquidctl initialize all
ExecStart=liquidctl --match kraken set pump speed 60
ExecStart=liquidctl --match kraken set fan speed  25 0  30 10  20 20  40 45  50 60  60 80 70 100
ExecStart=liquidctl --match "smart device" set fan1 speed 30
ExecStart=liquidctl --match "smart device" set fan2 speed 30

[Install]
WantedBy=default.target
```

_See [liquidctl's readme](https://github.com/liquidctl/liquidctl) for more information_

```sh
doas systemctl enable liquidctl-silent.service
doas systemctl start liquidctl-silent.service
```

# Development Workflows

Clone `.config/nvim` from this repo, then get packer all setup.

### Rust

```sh
pacman -S rustup
rustup default stable
```

### Lua

Setup Rust, then install the following:

```sh
cargo install stylua
yay -S lua-language-server
```

### Javascript, JSON, HTML, etc

Uses `n` to manage node versions, and `pnpm` in place of `npm`.

```sh
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
rm -rf n
npm install -g pnpm
pnpm install -g n
n latest

pnpm i -g @fsouza/prettierd vscode-langservers-extracted
```
