# Plugin Install
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light-mode for \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-autosuggestions \
  Aloxaf/fzf-tab \
  softmoth/zsh-vim-mode

zinit snippet OMZP::git
# zinit snippet OMZP::sudo (Heavy)
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::tmux
# zinit snippet OMZP::aws
# zinit snippet OMZP::docker
# zinit snippet OMZP::docker-compose
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found

autoload -Uz compinit
if [[ -f $HOME/.zcompdump ]]; then
  compinit
else
  compinit -i
fi
zinit cdreplay -q

# Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--color=bg+:-1,bg:-1,border:#FFFFFF,spinner:#6ec2b3,hl:#6ec2b3,fg:#FFFFFF,header:#6ec2b3,info:#FFFFFF,pointer:#6ec2b3,marker:#6ec2b3,fg+:-1,preview-bg:-1,prompt:#FFFFFF,hl+:#6ec2b3,gutter:-1'

autoload -U colors && colors
PS1='%B%F{cyan}%(4~|...|) %3~%F{cyan}$(branch=$(git_branch_name) && [ -n "$branch" ] && echo " %F{white}${bold_cyan}$branch${white}") %F{white}> %b%f%k'
setopt prompt_subst

# Customs
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/keysets.zsh

# History
if [ ! -f ~/.zsh_history ]; then
  touch ~/.zsh_history
fi

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Envs
export MASON=${HOME}/.local/share/nvim/mason
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
