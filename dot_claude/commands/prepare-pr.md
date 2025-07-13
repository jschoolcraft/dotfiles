Prepare a pull request for the current branch. Optional argument: Brief description of the changes made: $ARGUMENTS

At the end of this message, I will ask you to do something.
Please follow the "Clean, Validate, Document, Create" workflow when you start.

# Clean
First, clean up the commit history and working directory:
- Run git status to check for any uncommitted changes
- If there are uncommitted changes, decide whether to commit, stash, or discard them
- Review the commit history with git log to identify any commits that need cleanup
- Perform interactive rebase if needed to squash fixup commits or improve commit messages
- Ensure each commit has a clear, descriptive message following the project's conventions

# Validate
Next, run comprehensive validation checks:
- Run all tests and ensure they pass (use the project's test command)
- Run linting and type checking if available (look for lint/typecheck scripts)
- Check for any TODO comments or debug code that should be removed
- Verify no sensitive information (API keys, passwords, etc.) is being committed
- Run a clean build to ensure everything compiles correctly
- Check for any new dependencies and ensure they're properly documented

# Document
Create comprehensive PR documentation:
- Generate a detailed PR title that summarizes the main change
- Analyze all commits since branching to understand the full scope of changes
- Create a PR description including:
  - Summary of what was changed and why
  - Breaking changes (if any)
  - Testing instructions
  - Screenshots/demos for UI changes
  - Migration notes if applicable
- Identify appropriate reviewers based on the files changed
- Suggest relevant labels (feature, bugfix, breaking-change, etc.)

# Create
Finally, create and prepare the pull request:
- Push the branch to origin if not already pushed
- Create a draft PR using gh pr create with the generated title and description
- Add suggested reviewers and labels
- Run any additional CI checks if possible locally
- Convert to ready-for-review once all validations pass
- Provide the PR URL and a summary of what was created

If any validation step fails, fix the issues before proceeding to create the PR.

$ARGUMENTS