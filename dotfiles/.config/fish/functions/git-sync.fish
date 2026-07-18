# git-sync — Sync local branches with remote origin
#
# Fetches latest refs, prunes stale remote-tracking branches, then deletes
# any local branch that no longer exists on origin. Uses safe delete (-d)
# so unmerged branches are never removed. Protects common default branches.
#
# Usage: git-sync
#   Run from any directory inside a git repository.
#   Outputs each deleted branch, or "Everything in sync." if nothing to do.
#
# See also: git fetch --prune, git remote prune
function git-sync --description "Sync local branches with remote, delete stale locals"
    if not git rev-parse --is-inside-work-tree &>/dev/null
        echo "Not inside a git repository." >&2
        return 1
    end

    # Branches that should never be deleted even if absent from remote
    set --local protected main master develop
    set --local current (git branch --show-current)

    # Fetch latest refs and remove remote-tracking branches that no longer exist
    git fetch --prune

    # Build list of remote branch names (stripping the origin/ prefix)
    set --local remote_branches
    for branch in (git branch --remotes --format='%(refname:short)')
        set --append remote_branches (string replace --regex '^origin/' '' "$branch")
    end

    # Delete local branches not found on remote
    set --local deleted 0
    for branch in (git branch --format='%(refname:short)')
        test "$branch" = "$current"; and continue
        contains -- "$branch" $protected; and continue
        contains -- "$branch" $remote_branches; and continue

        echo "Deleting stale branch: $branch"
        git branch -d "$branch"
        and set deleted (math $deleted + 1)
    end

    test $deleted -eq 0; and echo "Everything in sync."
end
