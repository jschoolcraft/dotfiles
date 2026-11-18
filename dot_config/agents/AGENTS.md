# Global agent instructions

Shared by every coding agent on every machine (Claude Code, Codex, Pi, ...). Agent-specific
files like `~/.claude/CLAUDE.md` are thin wrappers that point here.

- Always trim trailing whitespace
- Never include Co-Authored-By footer in git commits

## Dotfiles

Dotfiles — including `~/.hammerspoon` — are managed by **chezmoi**. Source repo:
`~/.local/share/chezmoi/` (remote `github.com:jschoolcraft/dotfiles`, branch `main`).

**Editing a file under `~/` does NOT update the source.** To sync an edit back, run
`chezmoi re-add <target-path>`, or edit the source file directly. Commits and pushes happen in
`~/.local/share/chezmoi/`, not in `~`.

Useful: `chezmoi source-path <target>` resolves a target to its source; `chezmoi diff` shows
source→target — so a *reversed* diff means the target is ahead and needs `re-add`.

This file lives at `~/.config/agents/AGENTS.md` and is itself chezmoi-managed.
