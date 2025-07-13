Manage git branch operations safely. Specify the operation type (create, rebase, merge, cleanup, etc.): $ARGUMENTS

At the end of this message, I will ask you to do something.
Please follow the "Status, Strategy, Safety, Execute, Verify" workflow when you start.

# Status
First, assess the current git state and requirements:
- Run git status to check for uncommitted changes
- Review current branch and its relationship to main/beta branches
- Check if there are any merge conflicts or pending operations
- Identify any stashes or work-in-progress that needs attention
- Understand the target operation and its requirements
- Check remote status and whether local branch is up to date
- Review recent commit history to understand the current state

# Strategy
Plan the git operation strategy:
- Determine the safest approach for the requested operation
- Identify any prerequisites (commits, pushes, etc.) that need to happen first
- Plan the sequence of git commands needed
- Consider the impact on other team members or shared branches
- Identify any coordination needed with other developers
- Plan for potential rollback scenarios if something goes wrong
- Choose appropriate branch naming conventions if creating new branches

# Safety
Implement safety measures before executing git operations:
- Commit or stash any uncommitted changes
- Create backup references for important commits (tags or branch refs)
- Verify that destructive operations won't lose important work
- Ensure local repository is clean and in a good state
- Check that you're on the correct branch before making changes
- Verify remote repository access and permissions
- Consider creating a backup branch for complex operations

# Execute
Perform the git operations safely:
- Execute git commands in the planned sequence
- Handle any conflicts or issues that arise during the process
- Use appropriate git flags and options for safety (e.g., --no-ff for merges)
- Follow project conventions for commit messages and branch names
- Push changes to remote when appropriate
- Clean up temporary references or branches created during the process
- Document any manual conflict resolutions or special steps taken

# Verify
Confirm the operation completed successfully:
- Check that the repository is in the expected final state
- Verify all intended changes are present and correct
- Ensure no unintended changes or data loss occurred
- Test that the codebase still builds and basic functionality works
- Confirm remote repository reflects the intended changes
- Verify that branch relationships and history are correct
- Update any related documentation or tracking systems

Common operations supported:
- Branch creation with proper naming conventions
- Safe rebasing with conflict resolution
- Merge operations (fast-forward and merge commits)
- Branch cleanup and deletion
- Hotfix branch creation and management
- Release branch preparation
- Cherry-picking commits between branches

$ARGUMENTS