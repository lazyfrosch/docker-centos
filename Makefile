
all: pull build

pull:
	$(MAKE) -C base $@
	$(MAKE) -C systemd $@

build:
	$(MAKE) -C base $@
	$(MAKE) -C systemd $@

push:
	$(MAKE) -C base $@
	$(MAKE) -C systemd $@
