#!/bin/bash
SESSION_NAME='registry-api'
PROJECT_ROOT="~/Documents/Project/Bitmark/bitmark"
PROJECT_NAME="bitmark-registry-api"
PROJECT_PATH="${PROJECT_ROOT}/${PROJECT_NAME}"

tmux start-server

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    dir="node"
    logfile="stdout.log"

    # remove log file if exist
    [ -f stdout.log ] && rm ${logfile}

    tmux new-session -d -s ${SESSION_NAME} -n $dir
    tmux send-keys -t ${SESSION_NAME} "cd ${PROJECT_PATH}" C-m
    tmux send-keys -t ${SESSION_NAME} "forever start -f -o ${logfile} -w --watchDirectory src app.js && tail -f ${logfile}" C-m
    tmux rename-window -t0 "node"

    tmux select-window -t ${SESSION_NAME}:0

    tmux set-hook -g session-closed "run-shell 'forever stopall; sleep 2'"
fi

tmux attach-session -t ${SESSION_NAME}
