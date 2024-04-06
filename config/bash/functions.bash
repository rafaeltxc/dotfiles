# Git branch
git_branch_name() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

# Commit to git
commit() {
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        echo "Usage: commit 'message' 'description'"
        return
    fi

    git add .
    if [ -n "$1" ] && [ -n "$2" ]; then
        git commit -m "$1" -m "$2"
        git push
    elif [ -n "$1" ]; then
        git commit -m "$1"
        git push
    else
        git reset .
        echo "Missing commit message."
    fi
}
