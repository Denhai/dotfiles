function gcob
    # input prompt for a branch name into a variable
    read -l -P "Branch name: " branch_name
    or return

    # now create and switch to that branch
    git switch -c $branch_name
end
