#!/bin/bash
SESSION_NAME='webapp'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="bitmark-webapp"
PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_NAME}

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # account client side
    dir1="webapp-client"
    tmux new-session -d -s ${SESSION_NAME} -n $dir1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}/${dir1}" C-m
    tmux send-keys -t ${SESSION_NAME} 'npm run watch:dev' C-m
    tmux rename-window -t0 "client"

    # accoutn server side
    dir2="webapp"
    tmux new-window -t ${SESSION_NAME}:2 -n $dir2
    tmux send-keys -t ${SESSION_NAME}:2 "cd ${PROJECT_PATH}/${dir2}" C-m
    tmux send-keys -t ${SESSION_NAME}:2 'sleep 15; go run main.go' C-m
    tmux rename-window -t2 "webapp-server"

    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
