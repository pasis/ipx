ifeq ($(KERNELRELEASE),)

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
.PHONY: build clean
build:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
clean:
	rm -f *.o core .depend .*.cmd *.ko *.mod.c *.mod .*.o.d modules.order Module.symvers
	rm -rf .tmp_versions

else

$(info Building with KERNELRELEASE = ${KERNELRELEASE})
obj-m := ipx.o
ipx-y := af_ipx.o ipx_route.o ipx_proc.o pe2.o p8023.o sysctl_net_ipx.o

endif
