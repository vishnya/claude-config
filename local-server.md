# Rachel's Claude Code Setup

## Environment
- Remote server: Hetzner VPS (Ubuntu 24.04) at 5.161.182.15
- `claude` user for dev, `locus` user runs Locus service
- Caddy reverse proxy: `<project>.5.161.182.15.nip.io` (config: `/etc/caddy/Caddyfile`)
- All repos at `~/repos/`, each with its own CLAUDE.md

## Server-specific
- To work on a project: `cd ~/repos/<project>` — project's CLAUDE.md takes precedence
- Locus live deployment: /home/locus/locus/ (symlinked as ~/repos/locus-deploy). Sync: `rsync -av --exclude='.venv' --exclude='__pycache__' --exclude='data/' ~/repos/locus/ /home/locus/locus/ && sudo systemctl restart locus`
- uv over pip/venv
