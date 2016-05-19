#!/bin/bash
SESSION_NAME='work'

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # start zeus in port 3000 @ vpon-dsp
    tmux new-session -d -s ${SESSION_NAME} -n Zeus
    tmux send-keys -t ${SESSION_NAME} 'cd ~/Documents/Project/vpon-dsp; zeus start' C-m

    # start rails server in zeus on port 3000 @ vpon-dsp
    #tmux new-window -t ${SESSION_NAME}:1 -n Rails 'cd ~/Documents/Project/vpon-dsp; sleep 5; zeus server'
    tmux new-window -t ${SESSION_NAME}:1 -n Rails
    tmux send-keys -t ${SESSION_NAME}:1 'cd ~/Documents/Project/vpon-dsp; sleep 5; zeus server' C-m

    # run npm watch
    #tmux new-window -t ${SESSION_NAME}:2 -n npm-watch 'cd ~/Documents/Project/vpon-dsp/public/app/flux; npm run build:watch'
    tmux new-window -t ${SESSION_NAME}:2 -n npm-watch
    tmux send-keys -t ${SESSION_NAME}:2 'cd ~/Documents/Project/vpon-dsp/public/app/flux; npm run build:watch' C-m

    # tig
    #tmux new-window -t ${SESSION_NAME}:3 -n git 'cd ~/Documents/Project/vpon-dsp; tig'
    tmux new-window -t ${SESSION_NAME}:3 -n git
    tmux new-window -t ${SESSION_NAME}:3 'cd ~/Documents/Project/vpon-dsp; tig' C-m

    # display mytop & iostat of server 156
    #tmux new-window -t ${SESSION_NAME}:2 -n 56 'mytop -s 1 --noi --noheader -h 192.168.101.156 -u admin -p s123456'
    #tmux select-window -t ${SESSION_NAME}:2
    #tmux selectp -t 0
    #tmux split -v -p 50 'ssh aaron.chang@192.168.101.156 -t "iostat -x 1"'

    tmux select-window -t ${SESSION_NAME}:2
fi

tmux attach-session -t ${SESSION_NAME}
