function git-delete-local-gone
    # Pruning
    git fetch --prune

    # Collect branches
    set branches $(git for-each-ref --sort=-committerdate --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
    for branch in $branches
        echo $branch;
    end

    # Confirm delete
    read -l -P "Delete branches (y/n)" answer

    switch $answer
        case Y y
            echo Deleting branches
            for branch in $branches
                git branch -D $branch;
            end
    end
end
