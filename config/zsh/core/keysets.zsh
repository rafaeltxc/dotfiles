# Default writing
bindkey '^H'      backward-kill-word
bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line
bindkey '^[[3~'   delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Commands
bindkey -s '^l' 'ai\n'
bindkey -s '^o' 'lfcd\n'
bindkey -s '^F' 'fuzzy\n'
bindkey -s '^n' 'nv\n'
bindkey -s '^r' 'rec\n'
