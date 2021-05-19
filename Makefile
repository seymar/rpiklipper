include config.mk

# Monitor
m: monitor
mon: monitor
monitor:
	stty -f $(MONPORT) speed $(MONBAUD) | cat $(MONPORT)

s: screen
screen: ~/.screenrc
	@echo "CTRL + A, CTRL + \\ to exit"
	screen -O $(MONPORT) $(MONBAUD)

~/.screenrc:
	@echo "efscrollback 500000" > $@
	@echo "termcapinfo xterm* ti@:te@" >> $@
	@echo "defscrollback 10000" >> $@


install:
	cp src/* boot/

