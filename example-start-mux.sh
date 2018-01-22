#!/bin/sh
set -e

if tmux has-session -t foobar 2> /dev/null; then
    tmux attach -t foobar
    exit
fi

tmux new-session -d -s foobar -n ide

# start vim in main window
tmux send-keys -t foobar:ide "vim" Enter

# split 
tmux split-window -t foobar -h -p 30 -c "$PWD"
tmux send-keys -t foobar:ide.right "nvm use v8.9.4" Enter
tmux send-keys -t foobar:ide.right "make client" Enter

tmux split-window -t foobar -c "$PWD"

tmux send-keys -t foobar:ide.bottom-right "gvm use go1.8" Enter
tmux send-keys -t foobar:ide.bottom-right "export GOPATH=~/Projects/go" Enter
tmux send-keys -t foobar:ide.bottom-right "make server" Enter

tmux attach -t foobar:ide.left


tmux new-window -t foobar

