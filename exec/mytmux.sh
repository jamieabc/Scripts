#!/bin/sh

tmux start-server
#tmux new-session -d -s work -n MC
#tmux new-window -t work:1 -n OPS
#tmux new-window -t work:2 -n OPS2
#tmux new-window -t work:3 -n note
#tmux new-window -t work:4 -n qemu-linaro 'cd ~/src/qemu/qemu-src/qemu-linaro-1.0.50-2012.01/; bash -i'
#tmux new-window -t work:5 -n ICS 'cd ~/src/android-ics/; bash -i'
#tmux new-window -t work:6 -n qemu-1.0 'cd ~/src/qemu/qemu-src/qemu-1.0/; bash -i'
#tmux new-window -t work:7 -n Patrick 'cd ~/src/qemu/qemu-src/qemu-merge-android/qemu; bash -i'

tmux new-session -d -s work -n OPS
tmux new-window -t work:2 -n OPS2
tmux new-window -t work:3 -n note
tmux new-window -t work:4 -n v2bsp
tmux new-window -t work:5 -n tmp
tmux new-window -t work:6 -n gst
tmux new-window -t work:7 -n CL_Android
tmux new-window -t work:8 -n test
tmux new-window -t work:9 -n emacs
tmux new-window -t work:10 -n build

tmux select-window -t work:1
tmux attach-session -t work
