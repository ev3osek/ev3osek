# Target specific macros
TARGET = TwoTasks
TARGET_SOURCES = \
	LowPrioTask.c \
	HighPrioTask.c
TOPPERS_OSEK_OIL_SOURCE = ./TwoTasks.oil

# Here you could define to use OSEK-hooks with preceeding -D, for example
# -DPRETASKHOOK -DPOSTTASKHOOK -DERRORHOOK -DSTARTUPHOOK -DSHUTDOWNHOOK
DEFINES = 

# Don't modify below part
EV3OSEK_ROOT = ../..
include ../../OSEK_EV3/OSEK_EV3.mak
 
