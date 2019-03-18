# Defined in /var/folders/x9/v85ftmcd7vv_d9x_x82n_k2m0000gn/T//fish.sOlzx8/fco.fish @ line 2
function fco --description 'Fuzzy-find and checkout a branch'
	git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)" | grep -v HEAD | string trim | fzf | xargs git checkout
end
