function git-fix-upstream
  git branch (git rev-parse --abbrev-ref HEAD) --set-upstream-to origin/(git rev-parse --abbrev-ref HEAD)
end