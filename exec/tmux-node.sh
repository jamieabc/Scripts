#!/bin/bash
SESSION_NAME='node'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="bitmark-node"
PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_NAME}

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # account client side
    tab1="server"
    cmds="go run main.go"
    tmux new-session -d -s ${SESSION_NAME} -n $tab1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}" C-m
    tmux send-keys -t ${SESSION_NAME} "${cmds}" C-m
    tmux rename-window -t0 $tab1

    tab2="client"
    cmds2="npm run dev"
    tmux new-window -t ${SESSION_NAME}:1 -n $tab2
    tmux send-keys -t ${SESSION_NAME}:1 "cd ${PROJECT_PATH}/ui" C-m
    tmux send-keys -t ${SESSION_NAME}:1 "${cmds2}" C-m
    tmux rename-window -t1 $tab2


    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
