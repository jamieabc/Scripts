#!/bin/bash
SESSION_NAME='node-app'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="bitmark-node-app"
PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_NAME}

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # start electron
    tab1="electron"
    cmds="npm run start"
    tmux new-session -d -s ${SESSION_NAME} -n $tab1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}" C-m
    tmux send-keys -t ${SESSION_NAME} "${cmds}" C-m
    tmux rename-window -t0 $tab1

    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
