
all: pull build

pull:
	$(MAKE) -C base $@
	$(MAKE) -C init $@

build:
	$(MAKE) -C base $@
	$(MAKE) -C init $@

push:
	$(MAKE) -C base $@
	$(MAKE) -C init $@
