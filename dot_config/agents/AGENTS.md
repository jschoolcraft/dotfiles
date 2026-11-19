# Global agent instructions

Shared by every coding agent on every machine (Claude Code, Codex, Pi, ...). Agent-specific
files like `~/.claude/CLAUDE.md` are thin wrappers that point here.

- Always trim trailing whitespace, except where it carries meaning: Markdown hard line breaks
  (two trailing spaces), diff/patch context lines, and fixtures or test data that must match
  byte for byte
- Never include Co-Authored-By footer in git commits

## Shareable output

Anything made for other people (decks, reports, dashboards, summaries) must open for anyone,
with no special account. Most readers don't have claude.ai.

- Default to self-contained files: one HTML file with inline CSS, JS and images (fonts from a
  CDN are fine), or PDF, Markdown, or plain text. Render a PDF alongside an HTML deck.
- Don't publish claude.ai artifacts or other account-gated links unless asked for that page.
- For work files, put the copy to share in the OneDrive sync folder
  (`~/Library/CloudStorage/OneDrive-KalerisCorporation/`) so Jeff can create a share link.
- Before calling it done, check it the way a reader will see it: open the HTML at a real
  browser size, and page through the PDF.

## Dotfiles

Dotfiles — including `~/.hammerspoon` — are managed by **chezmoi**. Source repo:
`~/.local/share/chezmoi/` (remote `github.com:jschoolcraft/dotfiles`, branch `main`).

**Editing a file under `~/` does NOT update the source.** To sync an edit back, run
`chezmoi re-add <target-path>`, or edit the source file directly. Commits and pushes happen in
`~/.local/share/chezmoi/`, not in `~`.

Useful: `chezmoi source-path <target>` resolves a target to its source; `chezmoi diff` shows
source→target — so a *reversed* diff means the target is ahead and needs `re-add`.

This file lives at `~/.config/agents/AGENTS.md` and is itself chezmoi-managed.
