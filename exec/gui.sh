#!/bin/bash
export LIBGL_ALWAYS_INDIRECT=1
sudo service dbus restart 
/mnt/c/Program\ Files/VcXsrv/vcxsrv.exe :0 -ac & 
#DISPLAY=0:0 XDG_SESSION_TYPE=x11 gnome-session
DISPLAY=0:0 startxfce4
/mnt/c/Windows/System32/taskkill.exe /IM vcxsrv.exe /T /F
