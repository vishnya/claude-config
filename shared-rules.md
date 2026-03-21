## Preferences
- No emojis unless asked
- Concise responses
- Fix things before testing unless I say otherwise
- When explaining decisions, say what things do in plain language AND name the concept so Rachel learns the proper term. Both directions: define jargon when you use it (e.g., "ring buffer — a fixed-size list that overwrites the oldest entry when full"), and name concepts when you explain them without jargon (e.g., "Linux prevents users from deleting each other's files in shared directories — this rule is called the sticky bit"). Also highlight what system design or AI concept the work illustrates. Don't force analogies or use cutesy language. Assume intelligence, not vocabulary. 1-2 sentences, woven into the flow.

## Workflow — Follow These Automatically

These are standing rules. Do NOT wait for Rachel to remind you.

### Sync
- **`git pull` before responding** to each user message. This catches changes from other sessions (phone, server, Mac) with no polling overhead. If there are new WORKLOG.md entries, briefly mention what the other session did.

### Commits
- **Commit early and often.** After every meaningful change (new feature, bug fix, refactor, test additions), commit immediately. Do not batch up multiple unrelated changes.
- **Commit before and after** risky operations so work is reversible.
- No "Co-Authored-By: Claude" or LLM attribution. No "Generated with Claude Code" footers.
- Commit messages: short, lowercase, imperative mood (e.g. "add cookie auth", "fix mobile reauth loop").

### Tests
- **Always run existing tests** before pushing to catch regressions.
- **Write tests for new functionality** — don't wait to be asked. If you add a feature or fix a bug, add tests covering it.
- If tests fail, fix the issue before moving on.

### Pushing
- After committing, **push to GitHub** immediately.
- On Mac, push via subtree: `git subtree push --prefix=<folder> <remote-name> main`
- If subtree push fails with non-fast-forward: `git subtree split --prefix=<folder> -b temp && git push <remote> temp:main --force && git branch -D temp`

### WORKLOG.md
- **Update on every commit**, not just at session end. Append a short entry (date, device, bullets).
- Push after updating so other devices see it immediately.
- Keep only the last 10 entries.

### New project checklist
When starting work on a new project/folder, ensure it has:
- `CLAUDE.md` — project-specific instructions, architecture, key files, test commands
- `WORKLOG.md` — session handoff notes
- `.gitignore` — appropriate for the language/framework
- Tests — at minimum a test file and instructions in CLAUDE.md for running them
- Git remote — added to the projects/remotes table

## Cross-Session Awareness

Rachel works across multiple devices (Mac, phone via claude-web, remote server). Every project has a `WORKLOG.md` for handoff between sessions.

### On session start (ALWAYS do this):
1. `git pull` to get latest
2. For the project you're working on, read its `WORKLOG.md`
3. Briefly tell Rachel what the last session did (especially if it was on a different device)

### During the session:
- On every meaningful commit, update `WORKLOG.md` and push — this is automatic, not optional
- If switching projects mid-session, read the new project's `WORKLOG.md` first

### Anki cards for concepts
- When a system design or AI concept comes up during work, create Anki cards:
  - **On Mac:** `python ~/code/anki_fox/claude_cards.py "concept" "definition" "example" [--type sysdesign|ai]`
  - **On server:** `python ~/repos/anki-fox/claude_cards_queue.py "concept" "definition" "example" [--type sysdesign|ai]` (queues for later sync)
- Cards go to "Claude System Design Learnings" (or "Claude AI Learnings" for AI concepts)
- Cards are bidirectional: one tests vocabulary (what is X?), the other tests pattern recognition (what concept solves this problem?)
- Include full context in the example: what the problem was, what the concept solved, and what project it was in
- Do this proactively whenever you explain a concept — don't wait to be asked

### On session end:
- Ensure `WORKLOG.md` is up to date and pushed
- Keep only the last 10 entries

## Projects

| Project | Mac path | Server path | Remote | Branch |
|---------|----------|-------------|--------|--------|
| Locus | ~/code/locus/ | ~/repos/locus/ | locus | main |
| Anki Fox | ~/code/anki_fox/ | ~/repos/anki-fox/ | anki-fox | main |
| Polymarket Trends | ~/code/polymarket_trends/ | ~/repos/polymarket-trends/ | polymarket-trends | main |
| Walkie | ~/code/walkie/ | ~/repos/walkie/ | walkie | master |
| Claude Config | ~/code/claude_config/ | ~/repos/claude-config/ | claude-config | main |
| Shared Auth | — | ~/repos/shared-auth/ | shared-auth | main |
