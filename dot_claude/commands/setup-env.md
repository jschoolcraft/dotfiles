Setup or validate development environment. Specify the type of setup needed (new project, dependencies, config, etc.): $ARGUMENTS

At the end of this message, I will ask you to do something.
Please follow the "Analyze, Install, Configure, Validate, Document" workflow when you start.

# Analyze
First, understand the project requirements and current state:
- Examine package.json, requirements.txt, Cargo.toml, or other dependency files
- Check for existing configuration files (.env, config files, etc.)
- Identify the technology stack and required tools
- Review any existing setup documentation (README, docs/)
- Check for version requirements and compatibility constraints
- Assess the target environment (development, CI, production-like)
- Identify any platform-specific requirements or dependencies

# Install
Set up the required dependencies and tools:
- Install the correct versions of runtime environments (Node.js, Python, etc.)
- Install package managers if needed (npm, yarn, pip, cargo, etc.)
- Install project dependencies using the appropriate package manager
- Install development tools (linters, formatters, build tools)
- Set up any required global tools or CLI utilities
- Install IDE extensions or plugins if documented
- Verify installations and check for any error messages

# Configure
Set up configuration files and environment settings:
- Create or update environment configuration files (.env, .env.local)
- Set up database connections and external service configurations
- Configure development server settings and ports
- Set up authentication keys and API credentials (securely)
- Configure build tools, linters, and code formatters
- Set up pre-commit hooks if the project uses them
- Configure IDE settings for consistent development experience

# Validate
Test that the environment is working correctly:
- Run the project's build command to ensure it compiles/builds successfully
- Start the development server and verify it runs without errors
- Run the test suite to ensure all tests pass
- Verify linting and formatting tools work correctly
- Test any database connections or external service integrations
- Check that all required environment variables are set
- Validate that hot reload/watch mode works for development

# Document
Create or update environment setup documentation:
- Document the setup process for future reference
- Note any platform-specific requirements or gotchas
- Record the versions of tools and dependencies used
- Document any manual configuration steps required
- Create troubleshooting notes for common setup issues
- Update the project README if setup instructions need changes
- Consider creating a setup script for automated environment setup

Common setup scenarios:
- New developer onboarding to an existing project
- Setting up CI/CD environment configuration
- Preparing development environment after system changes
- Validating environment after dependency updates
- Setting up project-specific development tools

$ARGUMENTS