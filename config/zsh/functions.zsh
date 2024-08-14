# Find and set branch name var if in git repository
function git_branch_name()
{
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]];
    then
        :
    else
        echo '- '$branch''
    fi
}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# fzf
fuzzy () {
    VAR=$(find "$HOME" | fzf)

    if [[ -d $VAR ]]; then
        cd "$VAR"
    elif [[ -f $VAR ]]; then
      (nvim "$VAR")
    fi
}

# CHange java version
jv () {
  if [ $# -eq 0 ]; then
      echo "No version supplied"
      return
  fi

  version="$1"
  sudo archlinux-java set "java-$version-openjdk"
}

# wf-recorder
# rec {
#     read -p "1. No audio\nWith audio\n" choice

#     if [ "$choice" = "1" ]; then
#         wf-recorder --file=~/Pictures/recording.mp4 -g "$(slurp)"
#     else
#         wf-recorder --audio --file=~/Pictures/recording.mp4 -g "$(slurp)"
#     fi
# }

# Activate Venv
venv () {
  source ./"$1"/bin/activate;
}

# Commit to github
commit() {
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: commit 'message' 'description'"
        return
    fi

    git add .;
    if [ -n "$1" ] && [ -n "$2" ]; then
        git commit -m "$1" -m "$2";
        git push;
    elif [ -n "$1" ]; then
        git commit -m "$1";
        git push;
    else
        git reset .;
        echo "Missing commit message.";
    fi
}

get() {
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: get 'PORT' 'URL'"
        return
    fi

    curl http://localhost:$1/$2;
}

post() {
    if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        echo "Usage: 'JSON' 'PORT' 'URL'"
        exit 0
    fi

    curl --header "Content-Type: application/json" \
        --request POST \
        --data "$1" \
        http://localhost:$2/$3
}

update() {
    if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        echo "Usage: 'JSON' 'PORT' 'URL'"
        exit 0
    fi

    curl --header "Content-Type: application/json" \
        --request UPDATE \
        --data "$1" \
        http://localhost:$2/$3
}

delete() {
    if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        echo "Usage: 'PORT' 'URL'"
        exit 0
    fi

    curl --request DELETE \
        http://localhost:$1/$2
}
