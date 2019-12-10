#!/bin/bash

echo "Starting 'root' tmux"
tmux new-session -d -s "root"
tmux send-keys -t root "sudo su -" Enter
 
echo "Starting 'projects notebook' tmux"
tmux new-session -d -s "projects_notebook"
tmux send-keys -t projects_notebook "source activate <conda env>" Enter
tmux send-keys -t projects_notebook "cd ~/<path to projects>" Enter
tmux send-keys -t projects_notebook "jupyter notebook" Enter
