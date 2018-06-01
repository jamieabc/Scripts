#!/bin/bash
SESSION_NAME='beats'
PROJECT_ROOT="~/Documents/Project/Bitmark"
PROJECT_NAME="beats-ex"
PROJECT_PATH="${PROJECT_ROOT}/${PROJECT_NAME}"

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    # account client side
    dir1="client"
    tmux new-session -d -s ${SESSION_NAME} -n $dir1
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}/${dir1}" C-m
    tmux send-keys -t ${SESSION_NAME} 'npm run watch:dev' C-m
    tmux rename-window -t0 "client"

    # accoutn server side
    dir2="server"
    tmux new-window -t ${SESSION_NAME}:1 -n $dir2
    tmux send-keys -t ${SESSION_NAME}:1 "cd ${PROJECT_PATH}/${dir2}" C-m
    tmux send-keys -t ${SESSION_NAME}:1 'npm run watch' C-m
    tmux rename-window -t1 "server"

    tmux select-window -t ${SESSION_NAME}:0

    tmux set-hook -g session-closed "run-shell 'forever stopall; sleep 2'"
fi

tmux attach-session -t ${SESSION_NAME}
