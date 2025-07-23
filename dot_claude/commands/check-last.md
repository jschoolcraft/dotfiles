At the end of this message, I’ll ask you to compare Git branches.

Please follow the “Explore, Analyze, Build, Test, Report” workflow when you begin.

⸻

🔍 Explore

Start by comparing the current working branch (including uncommitted changes) to the main branch.
Use Git diff tools and metadata to identify:
	•	All modified, added, or deleted files
	•	Which changes are committed vs uncommitted
	•	Commit messages and timestamps for context

Include Swift files, assets, config files, and UI changes — be thorough.

⸻

🧠 Analyze

Group changes by purpose (e.g., feature, fix, refactor, UI).
For each change:
	•	✅ Confirm what appears complete
	•	⚠️ Flag incomplete or questionable work (TODOs, debug code, etc.)
	•	🧪 Note anything that will require manual testing
	•	❌ Identify potential regressions or risky changes

If context is unclear, pause to ask questions before continuing.

⸻

🛠️ Build

Use the MCP server to perform a clean build of the current branch.
	•	✅ Report if the build succeeded
	•	❌ If the build fails, provide a summary of the errors
	•	Stop here if the build does not succeed — do not proceed

⸻

🧪 Manual Testing Guide

For each area that requires testing, provide:
	•	A brief description of what was changed
	•	Clear steps to test the change manually
	•	Expected behavior (what success looks like)

Example format:

Component: Settings View
Change: Added new "Sync iCloud" toggle
Steps to Test:
  1. Open the app
  2. Go to Settings
  3. Toggle "Sync iCloud" on/off
  4. Confirm iCloud logs reflect the toggle
Expected Result: Toggle state persists and logs show correct sync status.

Repeat this format for every user-facing or interactive change.

⸻

📝 Report

Summarize your findings:
	•	A high-level overview of what changed and why
	•	✅ What’s complete
	•	⚠️ What’s incomplete or needs attention
	•	🛠️ Build status
	•	🧪 Manual Testing Guide with steps
	•	🔧 Any concerns, next actions, or open questions

Use commit hashes, file paths, or line numbers as needed.

⸻

Now, run this workflow comparing the current branch to main, build the project, and return a full analysis and manual testing guide.

