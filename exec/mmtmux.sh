#!/bin/bash
SESSION_NAME='work'

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # dsp rails at port 3000
    tmux new-session -d -s ${SESSION_NAME} -n dsp-rails
    tmux send-keys -t ${SESSION_NAME} 'cd ~/Documents/Project/vpon-dsp' C-m
    tmux send-keys -t ${SESSION_NAME} 'spring stop; rails s -p3000' C-m

    # dsp js bundle
    tmux new-window -t ${SESSION_NAME}:2 -n dsp-js
    tmux send-keys -t ${SESSION_NAME}:2 'cd ~/Documents/Project/vpon-dsp/public/app/flux' C-m
    tmux send-keys -t ${SESSION_NAME}:2 'npm run hot' C-m

    # ssp rails at port 4000
    tmux new-window -t ${SESSION_NAME}:3 -n ssp-rails
    tmux send-keys -t ${SESSION_NAME}:3 'cd ~/Documents/Project/ssp-web-api/' C-m
    tmux send-keys -t ${SESSION_NAME}:3 'rails s -p4000'

    # ssp js at port 4001
    tmux new-window -t ${SESSION_NAME}:4 -n ssp-js
    tmux send-keys -t ${SESSION_NAME}:4 'cd ~/Documents/Project/ssp-web-ui/' C-m
    tmux send-keys -t ${SESSION_NAME}:4 'npm run start'

    # id
    #tmux new-window -t ${SESSION_NAME}:3 -n idp
    #tmux send-keys -t ${SESSION_NAME}:3 'cd ~/Documents/Project/vpon-idp' C-m
    #tmux send-keys -t ${SESSION_NAME}:3 'spring stop; rails s -p3001' C-m

    tmux select-window -t ${SESSION_NAME}:2
fi

tmux attach-session -t ${SESSION_NAME}
