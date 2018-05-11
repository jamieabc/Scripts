#!/bin/bash
# exit 0
SESSION_NAME='work'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="bitmark-webapp"
PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_NAME}

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # account client side
    dir1="account-client"
    tmux new-session -d -s ${SESSION_NAME} -n $dir1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}/${dir1}" C-m
    tmux send-keys -t ${SESSION_NAME} 'npm run watch:dev' C-m

    # webapp client side
    dir2="webapp-client"
    tmux new-window -t ${SESSION_NAME}:1 -n $dir2
    tmux send-keys -t ${SESSION_NAME}:1 "cd ${PROJECT_PATH}/${dir2}" C-m
    tmux send-keys -t ${SESSION_NAME}:1 'npm run watch:dev' C-m

    # webapp server side
    dir3="webapp"
    tmux new-window -t ${SESSION_NAME}:2 -n ${dir3}
    tmux send-keys -t ${SESSION_NAME}:2 "cd ${PROJECT_PATH}/${dir3}" C-m
    tmux send-keys -t ${SESSION_NAME}:2 'go run main.go' C-m

    # accoutn server side
    dir4="account"
    tmux new-window -t ${SESSION_NAME}:3 -n $dir4
    tmux send-keys -t ${SESSION_NAME}:3 "cd ${PROJECT_PATH}/${dir4}" C-m
    tmux send-keys -t ${SESSION_NAME}:3 'go run main.go' C-m

    # id
    #tmux new-window -t ${SESSION_NAME}:3 -n idp
    #tmux send-keys -t ${SESSION_NAME}:3 'cd ~/Documents/Project/vpon-idp' C-m
    #tmux send-keys -t ${SESSION_NAME}:3 'spring stop; rails s -p3001' C-m

    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
