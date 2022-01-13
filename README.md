# GPD Pocket 3 Linux
![image](https://user-images.githubusercontent.com/56395503/149221749-fcedf793-c2fb-4516-9c75-bf6161a899d9.png)

## For Kali 2021.4a:
```
# apt-get update
# apt-get dist-upgrade
# apt-get install xinput tlp
```
### Screen Orientation
#### X11
```
# xrandr -o right
```
#### fb
```
# nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet fbcon=rotate:1"
GRUB_CMDLINE_LINUX="fbcon=rotate:1"
GRUB_GFXMODE=1200x1920x32
# update-grub
```
#### lightdm
```
# nano /etc/lightdm/lightdm.conf
[SeatDefaults]
display-setup-script=xrandr -o right
```
#### TouchScreen & Stylus
```
# nano /etc/xorg.conf.d/99-touchsreen.conf
Section "InputClass"
  Identifier    "calibration"
  MatchProduct  "GXTP7380"
  Option        "TransformationMatrix" "0 1 0 -1 0 1 0 0 1"
EndSection
```
### Powersave tweeks
```
# nano /etc/tlp.conf
CPU_SCALING_GOVERNOR_ON_AC=powersave 
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_ENERGY_PERF_POLICY_ON_BAT=power
CPU_BOOST_ON_AC=1 
CPU_BOOST_ON_BAT=0
PLATFORM_PROFILE_ON_AC=performance 
PLATFORM_PROFILE_ON_BAT=low-power
DISK_IOSCHED="mq-deadline"
PCIE_ASPM_ON_AC=default 
PCIE_ASPM_ON_BAT=powersupersave
```

### Capture HDMI input
```
ffplay /dev/video3
```

## ToDo
* SoundCard
* GRUB Menu Orientation
* Stylus Buttons Remap
* Automatic Screen Rotation
* Hibernate / Suspend / Hybrid Sleep

## Links:
- https://gpd.hk/gpdpocket3
- https://www.reddit.com/r/GPDPocket/comments/s16p9v/gpd_pocket_3_and_ubuntu_20043_so_far/hsaos2r/
- https://www.reddit.com/r/GPDPocket/comments/s16p9v/gpd_pocket_3_and_ubuntu_20043_so_far/hs7sqyw/
- https://liliputing.com/2021/11/running-linux-on-the-gpd-pocket-3-mini-laptop.html
- https://wiki.archlinux.org/title/GPD_Pocket

## Official
- https://gpd.hk/gpdpocket3firmware
  > 2022-01-13 The Pocket 3 glass touchpad upgrade program solves the phenomenon of the mouse jumping randomly when moving the mouse pointer with the touchpad. The Pocket 3 high-end and low-end models are common.
