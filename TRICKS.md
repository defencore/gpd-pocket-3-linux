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
└─$ xinput --list-props 21

> 0°
[  0  1  0 ]
[ -1  0  1 ]
[  0  0  1 ]
└─$ xinput set-prop '21' 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
└─$ xinput set-prop '16' 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
└─$ xrandr --output DSI-1 --rotate right

> 90°
[ -1  0  1 ]
[  0 -1  1 ]
[  0  0  1 ]
└─$ xinput set-prop '21' 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
└─$ xinput set-prop '16' 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
└─$ xrandr --output DSI-1 --rotate inverted

> 180°
[  0 -1  1 ]
[  1  0  0 ]
[  0  0  1 ]
└─$ xinput set-prop '21' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
└─$ xinput set-prop '16' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
└─$ xrandr --output DSI-1 --rotate left

> 270°
[  1  0  0 ]
[  0  1  0 ]
[  0  0  1 ]
└─$ xinput set-prop '21' 'Coordinate Transformation Matrix'  1 0 0 0 1 0 0 0 1
└─$ xinput set-prop '16' 'Coordinate Transformation Matrix'  1 0 0 0 1 0 0 0 1
└─$ xrandr --output DSI-1 --rotate normal
```

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
#### Disable Touchpad
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
### Accelerometer
```
└─$ watch -n 1 cat /sys/bus/iio/devices/iio:device0/in_accel_*_raw
X-axis: 1011
Y-axis: 2
Z-axis: -157

> 0°   X= [ 1 - 1000   ] Y= [ -500 - 500 ]
> 90°  X= [ -500 - 500 ] Y= [ 1 - 1000   ]
> 180° X= [ -1000 - 0  ] Y= [ -500 - 500 ]
> 270° X= [ -500 - 500 ] Y= [ -1000 - 0  ] 
```

## Links:
- https://gpd.hk/gpdpocket3
- https://www.reddit.com/r/GPDPocket/comments/s16p9v/gpd_pocket_3_and_ubuntu_20043_so_far/hsaos2r/
- https://www.reddit.com/r/GPDPocket/comments/s16p9v/gpd_pocket_3_and_ubuntu_20043_so_far/hs7sqyw/
- https://www.reddit.com/r/GPDPocket/comments/s31qi8/gpd_p3_no_sound_linux/
- https://liliputing.com/2021/11/running-linux-on-the-gpd-pocket-3-mini-laptop.html
- https://wiki.archlinux.org/title/GPD_Pocket
- https://gist.github.com/tonitch/59b6fc10a2143cd35c54055dec0cb81b
