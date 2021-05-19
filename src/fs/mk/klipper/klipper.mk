klipper_url := https://github.com/KevinOConnor/klipper

# klipper:

klipper/.git: %/.git:
	git clone $(klipper_url) $*

