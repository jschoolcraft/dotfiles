# Claude Commands

Custom Claude CLI commands for development workflows.

## Commands

- **branch-manage** - Safely handle git operations like branch creation, rebasing, merging, and cleanup
- **check-last** - Compare current branch to beta, build, and generate testing guide with detailed change analysis
- **checkpoint** - Create session state summary and generate detailed checklist for next steps
- **debug-investigate** - Systematically investigate and debug issues with structured root cause analysis
- **explore-plan-code-test** - Complete 4-phase development workflow: explore codebase, plan implementation, write code, and test
- **new-issue** - Transform brief descriptions into properly formatted GitHub issues with context and implementation details
- **prepare-pr** - Clean up commits, validate code, and create comprehensive pull request with proper documentation
- **refactor-cleanup** - Perform safe code refactoring with comprehensive testing and incremental changes
- **setup-env** - Setup or validate development environment with dependency installation and configuration

## Workflow Summary

**Core Development:**
- `new-issue` → `explore-plan-code-test` → `prepare-pr` → `check-last`

**Maintenance & Operations:**
- `debug-investigate` - systematic debugging
- `refactor-cleanup` - safe code improvements
- `branch-manage` - git workflow operations
- `setup-env` - environment setup/validation