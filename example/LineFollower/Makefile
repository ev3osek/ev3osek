# Target specific macros
TARGET = LineFollower
TARGET_SOURCES = \
	lightvalueeventdispatchertask.c \
	linefollowertask.c \
	toucheventdispatchertask.c
TOPPERS_OSEK_OIL_SOURCE = ./LineFollower.oil

# Here you could define to use OSEK-hooks with preceeding -D, for example
# -DPRETASKHOOK -DPOSTTASKHOOK -DERRORHOOK -DSTARTUPHOOK -DSHUTDOWNHOOK
DEFINES = 

# Don't modify below part
EV3OSEK_ROOT = ../..
include ../../OSEK_EV3/OSEK_EV3.mak
 
