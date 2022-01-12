# GPD Pocket 3 Linux
![image](https://user-images.githubusercontent.com/56395503/149167228-2ab2cd3c-c7b7-4400-b359-eabecbd31dc1.png)

## For Kali 2021.4a:
```
# apt-get update
# apt-get dist-upgrade
```
### Screen Orientation
#### X11
```
# xrandr -o right
```
#### FB
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

### Capture HDMI input
```
ffplay /dev/video3
```

## ToDo
* SoundCard
* GRUB Menu Orientation
* Stylus Buttons Remap
