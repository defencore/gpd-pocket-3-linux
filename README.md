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
└─$  xrandr -o right
```
#### fb
```
└─# nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet fbcon=rotate:1"
GRUB_CMDLINE_LINUX="fbcon=rotate:1"
GRUB_GFXMODE=1200x1920x32
└─# update-grub
```
#### lightdm
```
└─# nano /etc/lightdm/lightdm.conf
[SeatDefaults]
display-setup-script=xrandr -o right
```
#### TouchScreen & Stylus
```
└─# nano /etc/X11/xorg.conf.d/99-touchsreen.conf
Section "InputClass"
  Identifier    "calibration"
  MatchProduct  "GXTP7380"
  Option        "TransformationMatrix" "0 1 0 -1 0 1 0 0 1"
EndSection
```
### Powersave tweeks
```
└─# nano /etc/tlp.conf
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
└─$ ffplay /dev/video3
```
## Tweaks
### xinput
```
└─$ xinput --list
⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳ HAILUCK CO.,LTD USB KEYBOARD Mouse        id=12   [slave  pointer  (2)]
⎜   ↳ GXTP7380:00 27C6:0113                     id=16   [slave  pointer  (2)]
⎜   ↳ GXTP7380:00 27C6:0113 Stylus Pen (0)      id=21   [slave  pointer  (2)]
⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    ↳ Power Button                              id=6    [slave  keyboard (3)]
    ↳ Video Bus                                 id=7    [slave  keyboard (3)]
    ↳ Power Button                              id=8    [slave  keyboard (3)]
    ↳ Sleep Button                              id=9    [slave  keyboard (3)]
    ↳ SHUNCCM2MP: SHUNCCM2MP                    id=10   [slave  keyboard (3)]
    ↳ HAILUCK CO.,LTD USB KEYBOARD              id=11   [slave  keyboard (3)]
    ↳ HAILUCK CO.,LTD USB KEYBOARD System Control       id=13   [slave  keyboard (3)]
    ↳ HAILUCK CO.,LTD USB KEYBOARD Consumer Control     id=14   [slave  keyboard (3)]
    ↳ HAILUCK CO.,LTD USB KEYBOARD Wireless Radio Control       id=15   [slave  keyboard (3)]
    ↳ GXTP7380:00 27C6:0113 Stylus              id=17   [slave  keyboard (3)]
    ↳ GXTP7380:00 27C6:0113 Keyboard            id=18   [slave  keyboard (3)]
    ↳ Intel HID events                          id=19   [slave  keyboard (3)]
    ↳ Intel HID 5 button array                  id=20   [slave  keyboard (3)]
```
#### Disable Touchscreen
```
└─$ xinput set-prop 16 "Device Enabled" 0
```
#### Disable Toucpad
```
└─$ xinput set-prop 12 "Device Enabled" 0
```
#### Disable Stylus
```
└─$ xinput set-prop 21 "Device Enabled" 0
```
#### Add Touchpad secondary pointer
```
└─$ xinput create-master touchpad
> will create secondary touchpad pointer with id=23
└─$ xinput reattach 12 23
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
