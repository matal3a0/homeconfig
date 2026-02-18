#!/bin/bash

SESSION_NAME="jbjorn"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux attach-session -t "$SESSION_NAME" \; select-window -t "$SESSION_NAME:1"
    exit 0
fi

#eval $(ssh-agent -s)
#ssh-add ~/.ssh/id_ed25519

tmux new-session -d -s "$SESSION_NAME" -n Sessionnamn

tmux new-window -t "$SESSION_NAME" -n WINDOW1
tmux split-window -h -t "$SESSION_NAME:2"
tmux send-keys -t "$SESSION_NAME:2.1" "ssh server.com" Enter
tmux send-keys -t "$SESSION_NAME:2.2" "ssh server.com" Enter
#tmux send-keys -t "$SESSION_NAME:2" "sudo su - sysadm" Enter

tmux new-window -t "$SESSION_NAME" -n WINDOW2
tmux split-window -h -t "$SESSION_NAME:3"
tmux split-window -v -t "$SESSION_NAME:3.1"

tmux new-window -t "$SESSION_NAME" -n WINDOW3
tmux split-window -h -t "$SESSION_NAME:4"
tmux split-window -v -t "$SESSION_NAME:4.1"

tmux new-window -t "$SESSION_NAME" -n WINDOW4
tmux split-window -h -t "$SESSION_NAME:5"

# Anslut till sessionen
tmux attach-session -t "$SESSION_NAME"\; select-window -t "$SESSION_NAME:1"
