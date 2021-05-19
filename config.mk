
# Port number 1-N, is usually the same if no other devices are connected
PORTNO = 4
MONPORT = $(shell ls -1 /dev/cu.usbserial* | sed -n '$(PORTNO)p')
MONBAUD = 115200
