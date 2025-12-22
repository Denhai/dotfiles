function gcob
    # input prompt for a branch name into a variable
    set branch_name (read -l -P "Branch name: ")
    # now create and switch to that branch
    git switch -c $branch_name
end
