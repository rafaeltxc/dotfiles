# Find and set branch name var if in git repository
function git_branch_name() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
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

# Tail number of lines from a log file
tll () {
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    lines=${1}
    file=${2}
  else
    lines=500
    file=${1}
  fi

  sudo tail -"${lines}"f "${file}"
}

# fzf
fuzzy () {
  VAR=$(find $("pwd") | fzf)

  if [[ -d $VAR ]]; then
    cd "$VAR"
  elif [[ -f $VAR ]]; then
    (nvim "$VAR")
  fi
}

# Open NeoVim
nv () {
  if [ -n "$1" ]; then
    nvim "$1"
    return
  fi

  nvim
}

# Open NeoVim read mode
nvr () {
  if [ -n "$1" ]; then
    nvim -R "$1"
    return
  fi

  nvim -R
}

# Video record
rec () {
    echo "File name: "
    read choice
    wf-recorder -g "$(slurp)" -f ~/Pictures/"$choice".mp4
}

# Change java version
jv () {
  if [ $# -eq 0 ]; then
    echo "$(java -version)"
    return
  fi

  arg="$1"

  if [ "$arg" = "list" ]; then
    archlinux-java status
    return
  fi

  sudo archlinux-java set "java-$arg-openjdk"
}

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

# Parse text to json
json() {
  local input="$1"
  local json="{"

  IFS=',' read -rA pairs <<< "$input"

  for pair in "${pairs[@]}"; do
    IFS=':' read -r key value <<< "$pair"

    if [[ "${value:0:1}" == "{" && "${value: -1}" == "}" ]]; then
        value=$(json "${value:1:-1}")
    else
        value="\"$value\""
    fi

    json+="\"$key\":$value,"
  done

  json="${json%,}}"
  echo "$json"
}

# Open IP connection to local network
open-conn() {
  local port="${1:-8080}"

  local ip
  ip=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')

  if [ -z "$ip" ]; then
    ip="localhost"
    echo "[open-conn] Could not auto-detect LAN IP. Falling back to localhost."
  fi

  echo "[open-conn] Serving current directory on:"
  echo "  http://$ip:$port/"
  echo "[open-conn] Press Ctrl+C to stop the server."

  python3 -m http.server "$port"
}

# Get with curl
get() {
  if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: get PORT URL"
    echo "Example: get 8080 api/resource"
    return
  fi

  if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: get PORT URL"
    return 1
  fi

  curl "http://localhost:$1/$2"
}

# Post with curl
post() {
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "usage: post 'key:value,key:value' port url"
    echo "example: post 'key1:value1,key2:value2' 8080 api/resource"
    exit 0
  fi

  if [ "$#" -ne 3 ]; then
    echo "error: incorrect number of arguments."
    echo "usage: post 'key:value,key:value' port url"
    exit 1
  fi

  local json=$(json "$1")

  curl --header "content-type: application/json" \
      --request post \
      --data "'$json'" \
      http://localhost:$2/$3
}

# Update with curl
update() {
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: update 'key:value,key:value' PORT URL"
    echo "Example: update 'key1:value1,key2:value2' 8080 api/resource"
    return
  fi

  if [ "$#" -ne 3 ]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: update 'key:value,key:value' PORT URL"
    return 1
  fi

  local json=$(json "$1")

  curl --header "Content-Type: application/json" \
      --request PUT \
      --data "'$json'" \
      "http://localhost:$2/$3"
}

# Delete with curl
delete() {
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: delete PORT URL"
    echo "Example: delete 8080 api/resource"
    return
  fi

  if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: delete PORT URL"
    return 1
  fi

  curl --request DELETE \
      "http://localhost:$1/$2"
}
