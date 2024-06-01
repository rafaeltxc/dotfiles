# The configuration has two working options, first and less performatic, with zinit,
# the second way is by manually instantianting the configurations, it lacks some
# of the zinit goods and has some minor bugs, but has better performance.
#
# If you were to choose the zinit configuration, you need to comment the manual
# installation methods, and vice versa.

# Custom functions
source ~/.config/zsh/functions.zsh

# Definitions
source ~/.config/zsh/definitions.zsh

# Enable colors and change prompt
autoload -U colors && colors
PS1='%B%F{cyan}%(4~|...|) %3~%F{cyan}$(branch=$(git_branch_name) && [ -n "$branch" ] && echo " %F{white}-> ${bold_cyan}$branch${white}") %F{white}
 > %b%f%k'

# Enable substitution in the prompt.
setopt prompt_subst

# Plugins ZINIT
ZINIT_HOME="${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

#Plugins Source
# SOURCE_PL="${HOME}/.config/zsh/plugins"
# if [ ! -d "$SOURCE_PL" ]; then
#   mkdir -p "$(dirname $SOURCE_PL)"

#   # Clone plugins manually
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting "$SOURCE_PL"/zsh-syntax-highlighting
#   git clone https://github.com/zsh-users/zsh-autosuggestions "$SOURCE_PL"/zsh-autosuggestions
#   git clone https://github.com/marlonrichert/zsh-autocomplete "$SOURCE_PL"/zsh-autocomplete
#   git clone https://github.com/Aloxaf/fzf-tab "$SOURCE_PL"/fzf-tab
# fi

# Add in zsh plugins (ZINIT)
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light softmoth/zsh-vim-mode

# Add in snippets (ZINIT)
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::tmux
# zinit snippet OMZP::aws
# zinit snippet OMZP::docker
# zinit snippet OMZP::docker-compose
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::npm
zinit snippet OMZP::command-not-found

# Zsh history directory:
if [ ! -f ~/.zsh_history ]; then
  touch ~/.zsh_history
fi

# History options
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

# Load completions
autoload -Uz compinit && compinit
# (ZINIT)
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

eval "$(fzf --zsh)"

# Shortcuts (must be after plugin loading)
source ~/.config/zsh/keysets.zsh

# Envs
export FZF_DEFAULT_OPTS='--color=bg+:-1,bg:-1,border:#FFFFFF,spinner:#6ec2b3,hl:#6ec2b3,fg:#FFFFFF,header:#6ec2b3,info:#FFFFFF,pointer:#6ec2b3,marker:#6ec2b3,fg+:-1,preview-bg:-1,prompt:#FFFFFF,hl+:#6ec2b3,gutter:-1'
export MASON=${HOME}/.local/share/nvim/mason

# Manual source (must be last)
# source ${SOURCE_PL}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ${SOURCE_PL}/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ${SOURCE_PL}/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source ${SOURCE_PL}/fzf-tab/fzf-tab.zsh
