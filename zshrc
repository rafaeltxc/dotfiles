source_files() {
  local dirs=(
    "$HOME/.config/zsh/core"
    "$HOME/.config/zsh/misc"
    "$HOME/.config/zsh"
  )

  for dir in $dirs; do
    for file in $dir/*.zsh; do
      if [[ -f $file ]]; then
        source $file
      fi
    done
  done
}

source_files
