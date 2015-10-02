#!/bin/bash

tmux start-server
#tmux new-session -d -s work -n MC
#tmux new-window -t work:1 -n OPS
#tmux new-window -t work:2 -n OPS2
#tmux new-window -t work:3 -n note

# start zeus in port 3000 @ vpon-dsp
tmux new-session -d -s work -n Zeus 'cd ~/Documents/Project/Vpon/vpon-dsp; zeus start'

# start rails server in zeus on port 3000 @ vpon-dsp
tmux new-window -t work:1 -n Rails 'cd ~/Documents/Project/Vpon/vpon-dsp; sleep 5; zeus server'

# run babel @ vpon-dsp
tmux new-window -t work:2 -n Babel 'cd ~/Documents/Project/Vpon/vpon-dsp; rm -rf public/app/flux/build/; babel public/app/flux/src/ -d public/app/flux/build --modules amd -w'

# display mytop & iostat of server 156
#tmux new-window -t work:2 -n 56 'mytop -s 1 --noi --noheader -h 192.168.101.156 -u admin -p s123456'
#tmux select-window -t work:2
#tmux selectp -t 0
#tmux split -v -p 50 'ssh aaron.chang@192.168.101.156 -t "iostat -x 1"'

# Show server 156 as default window
tmux select-window -t work:2
tmux attach-session -t work
