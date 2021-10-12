function fbr
  git for-each-ref --count=30 --sort=-committerdate refs/heads/ refs/remotes/ --format="%(refname:short)" | grep -v HEAD | string trim | fzf | sed 's/origin\///'| xargs git checkout
end
