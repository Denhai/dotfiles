function git-whatever
    git add --all
    set -l message (git status --short)
    git commit -m "$message"
end