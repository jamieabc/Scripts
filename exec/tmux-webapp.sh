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
    dir1="account-client2"
    tmux new-session -d -s ${SESSION_NAME} -n $dir1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}/${dir1}" C-m
    tmux send-keys -t ${SESSION_NAME} 'npm run watch:dev' C-m
    tmux rename-window -t0 "client"

    # webapp server side
    dir3="webapp"
    tmux new-window -t ${SESSION_NAME}:1 -n ${dir3}
    tmux send-keys -t ${SESSION_NAME}:1 "cd ${PROJECT_PATH}/${dir3}" C-m
    sleep 1
    tmux send-keys -t ${SESSION_NAME}:1 'go run main.go' C-m
    tmux rename-window -t1 "server-app"

    # accoutn server side
    dir4="account"
    tmux new-window -t ${SESSION_NAME}:2 -n $dir4
    tmux send-keys -t ${SESSION_NAME}:2 "cd ${PROJECT_PATH}/${dir4}" C-m
    sleep 4
    tmux send-keys -t ${SESSION_NAME}:2 'go run main.go' C-m
    tmux rename-window -t2 "server-account"

    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
