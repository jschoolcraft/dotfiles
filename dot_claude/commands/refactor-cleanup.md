Perform safe refactoring and code cleanup. Specify the target area or type of cleanup needed: $ARGUMENTS

At the end of this message, I will ask you to do something.
Please follow the "Assess, Protect, Plan, Execute, Validate" workflow when you start.

# Assess
First, analyze the current state and refactoring scope:
- Identify the specific code area, component, or pattern to refactor
- Understand the current architecture and design patterns in use
- Assess the complexity and risk level of the proposed changes
- Check for existing technical debt and code quality issues
- Review dependencies and coupling with other components
- Identify any performance or maintainability concerns
- Look for existing tests that cover the refactoring area

# Protect
Next, ensure safety measures are in place before making changes:
- Run the full test suite to establish a baseline
- Create comprehensive test coverage for the area being refactored if missing
- Add integration tests to verify behavior at boundaries
- Document the current behavior and expected outcomes
- Create a backup branch or commit point for easy rollback
- Identify any critical paths or high-risk areas that need extra care
- Set up monitoring or logging to track the impact of changes

# Plan
Create a detailed refactoring strategy:
- Break down the refactoring into small, incremental steps
- Identify which changes can be automated vs. require manual intervention
- Plan the order of operations to minimize risk and maintain functionality
- Consider backward compatibility requirements
- Identify opportunities to improve naming, structure, and patterns
- Plan for any necessary documentation updates
- Consider the impact on other team members and coordinate if needed

# Execute
Implement the refactoring in small, safe increments:
- Make one logical change at a time, testing after each step
- Use automated refactoring tools where available (IDE refactoring, etc.)
- Maintain consistent code style and follow project conventions
- Update variable names, function signatures, and structure as planned
- Remove dead code, unused imports, and deprecated patterns
- Improve error handling and edge case coverage where appropriate
- Keep commits small and focused with clear descriptions

# Validate
Thoroughly verify the refactoring results:
- Run the complete test suite and ensure all tests pass
- Perform manual testing of affected functionality
- Check for any performance regressions or improvements
- Verify that the refactored code follows project standards
- Review the changes for any unintended side effects
- Update documentation to reflect any architectural changes
- Consider having the changes reviewed by another team member
- Monitor the application after deployment for any issues

Throughout the process, maintain the principle that refactoring should not change external behavior - only internal structure and quality.

$ARGUMENTS