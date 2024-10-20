# Main
alias vpn="sudo openvpn --config ~/Documents/Duxus/matrix_3-UDP4-1194-config.ovpn"
alias cats="sudo /opt/tomcat/bin/startup-debug.sh"

# System defaults
alias gp="grep"

# Better listing
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

# Misc
alias nv="nvim ."
alias refresh="source ~/.zshrc"
alias lg="lazygit"
alias pdf="mupdf"
alias cl="clear"
alias bl="bluetoothctl"

# Set default key behaviours
bindkey '^H'      backward-kill-word
bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line
bindkey '^[[3~'   delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
alias rec='
    echo "File name: "
    read choice
    wf-recorder -g "$(slurp)" -f ~/Pictures/"$choice".mp4
'

# Functions
bindkey -s '^o' 'lfcd\n'
bindkey -s '^F' 'fuzzy\n'

# Lazy loading

# Aliases for lazy loading
node() { lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }
nvm() { lazy_load_nvm; nvm "$@"; }
