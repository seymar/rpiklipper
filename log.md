# SD card
https://www.raspberrypi.org/software/operating-systems/

https://www.raspberrypi.org/documentation/installation/installing-images/mac.md

diskutil list

disktuil unmountDisk /dev/diskN

sudo dd bs=1m if=path_of_your_image.img of=/dev/rdiskN; sync

# UART0 terminal
There are two UARTs which are default to:
Model	            | first PL011 (UART0)   | Mini UART
Raspberry Pi Zero   | Primary               | Secondary
Raspberry Pi Zero W	| Secondary (Bluetooth) | Primary

On the Zero W add this to the config.txt to get a terminal on UART0
`dtoverlay=disable-bt`

# WiFi setup, join a network

wpa_supplicant.conf
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=NL
network={
 ssid="networkname"
 psk="password"
}
```

# Earlycon
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2835/BCM2835-ARM-Peripherals.pdf p.177
UART base address = 0x7E20100
This is an error and should be (added zero)
UART base address = 0x7E201000
This is a virtual address

Physical peripheral addresses range from 0x20000000-0x20FFFFFF

These are mapped onto 0x7E000000 - 0x7EFFFFFF

So the actual UART address is 0x20201000

`earlycon=pl011,mmio32,0x20201000`

# Examples
Go to:
/opt/vc