# Rachel's Claude Code Setup

## Environment
- Shell: zsh, conda python at `/opt/anaconda3`
- `ANTHROPIC_API_KEY` in `~/.zshrc` line 26
- Hammerspoon installed and running (hotkeys via `~/.hammerspoon/init.lua`)
- Anki runs as a Python process (`aqt.run()`) — `pgrep -x Anki` won't find it, use `lsof -i :8765`

## Active Projects
- **Anki Fox**: hotkey → screenshot → Claude → Anki cards
  - See full context: `~/.claude/projects/-Users-rachel/memory/anki_watcher.md`
  - Key files: `~/code/anki_fox/flask_server.py`, `config.py`, `models.py`, `hammerspoon/init.lua` (symlinked), `web/`
  - Server: launchd agent on port 5789, logs at `/tmp/anki-fox.log`

## Mac-specific
- Local monorepo at `~/code/` — all projects live here as subfolders.
- Each project gets its own remote GitHub repo; the `~/code` monorepo itself is never pushed.
- Remote dev server: Hetzner VPS at 5.161.182.15 (SSH as `claude` user)
