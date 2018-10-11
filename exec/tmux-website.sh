#!/bin/bash
SESSION_NAME='webapp'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="website"
PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_NAME}

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # account client side
    tab="server"
    cmds="npm run server:dev"
    tmux new-session -d -s ${SESSION_NAME} -n $tab
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}" C-m
    tmux send-keys -t ${SESSION_NAME} "${cmds}" C-m
    tmux rename-window -t0 $tab

    tmux select-window -t ${SESSION_NAME}:0
fi

tmux attach-session -t ${SESSION_NAME}
