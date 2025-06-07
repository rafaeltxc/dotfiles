# Zstyles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Prompt Config
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--color=bg+:-1,bg:-1,border:#FFFFFF,spinner:#81A1C1,hl:#81A1C1,fg:#FFFFFF,header:#81A1C1,info:#FFFFFF,pointer:#81A1C1,marker:#81A1C1,fg+:-1,preview-bg:-1,prompt:#FFFFFF,hl+:#81A1C1,gutter:-1'

autoload -U colors && colors
PS1='%B%F{cyan}%(4~|...|) %3~%F{cyan}$(branch=$(git_branch_name) && [ -n "$branch" ] && echo " %F{white}${bold_cyan}$branch${white}") %F{white}> %b%f%k'
setopt prompt_subst
