# ugly and dirty hack to avoid patching system's kernel headers
ccflags-y += "-DGREPROTO_NONSTD_EOIP=0x80"
ccflags-y += "-DGREPROTO_NONSTD_MAX=0x81"
ccflags-y += "-DGREPROTO_NONSTD_BASE=0x80"
obj-m  := eoip.o
obj-m  += gre.o
