Systematically investigate and debug an issue. Provide a brief description of the issue or error message: $ARGUMENTS

At the end of this message, I will ask you to do something.
Please follow the "Gather, Analyze, Reproduce, Investigate, Document" workflow when you start.

# Gather
First, collect all available information about the issue:
- Capture the exact error message, stack trace, or unexpected behavior
- Note when the issue started occurring (recent changes, deployments, etc.)
- Identify the environment where it's happening (dev, staging, prod, specific OS/browser)
- Gather relevant logs, console output, or error reports
- Note the steps that led to the issue
- Check if the issue is consistent or intermittent

# Analyze
Next, perform initial analysis of the gathered information:
- Parse the stack trace to identify the failing component/function
- Review recent commits that might be related to the issue area
- Check for any recent dependency updates or configuration changes
- Look for patterns in the error (timing, specific inputs, user actions)
- Identify which systems/components are involved
- Check if there are any known issues or similar reports

# Reproduce
Create a reliable way to reproduce the issue:
- Document the minimal steps needed to trigger the problem
- Identify the specific conditions required (data state, user permissions, etc.)
- Test if the issue occurs in different environments
- Try to create a minimal test case that demonstrates the problem
- Verify the reproduction steps work consistently
- Note any variations in behavior across different scenarios

# Investigate
Dive deep into the root cause:
- Add logging or debugging statements to trace execution flow
- Examine the state of variables and data at the point of failure
- Check for edge cases or boundary conditions
- Review related code paths and dependencies
- Test hypotheses about what might be causing the issue
- Use debugging tools appropriate for the technology stack
- Consider performance, memory, or concurrency issues if relevant

# Document
Create a comprehensive investigation report:
- Summarize the issue and its impact
- Document the root cause analysis and findings
- Provide the verified reproduction steps
- Suggest one or more potential solutions with trade-offs
- Identify any related issues that might need attention
- Note any preventive measures for the future
- Create or update relevant tests to catch this issue type

If a clear solution emerges during investigation, implement and test it. If multiple solutions are possible, present options with recommendations.

$ARGUMENTS