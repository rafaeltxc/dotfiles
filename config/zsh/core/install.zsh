# Check history file
if [ ! -f ~/.zsh_history ]; then
  touch ~/.zsh_history
fi

# ZINIT Config
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

zinit snippet OMZP::git # kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::tmux
# zinit snippet OMZP::aws
# zinit snippet OMZP::docker
# zinit snippet OMZP::docker-compose
# zinit snippet OMZP::npm

autoload -Uz compinit
if [[ -f $HOME/.zcompdump ]]; then
  compinit
else
  compinit -i
fi
zinit cdreplay -q
