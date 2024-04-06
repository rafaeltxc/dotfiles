#!/bin/bash

export MASON=/home/rtxct/.local/share/nvim/mason

# Bash functions
source ~/.config/bash/functions.bash

# Bash aliases
source ~/.config/bash/shortcuts.bash

# Enable colors and change prompt
PS1='\[\e[1;37m\]\w $(git_branch_name) > \[\e[0m\]'
export PS1

# History settings
HISTSIZE=10000
HISTFILESIZE=10000
HISTFILE=~/.bash_history
export HISTSIZE HISTFILESIZE HISTFILE

bind '"\t":menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
