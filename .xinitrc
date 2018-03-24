#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# Running the following command from ~/.config/i3/config rather than X startup
# exec --no-startup-id compton --config ~/.config/compton.conf -b
