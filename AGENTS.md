# Agent notes — cloud and parallel work

This repository is mostly static content (for example `games/reaction-arena/index.html`). There is no root build step today.

## VM startup

After each pull, run from the repo root:

```bash
bash scripts/vm-update.sh
```

The script is idempotent and only installs dependencies when manifest files exist (`package.json`, `pyproject.toml` + `uv`). It exits successfully when there is nothing to do.

## Parallel agents

- Use **separate branches** per independent task so agents do not conflict (`cursor/<topic>-7cb8` matches cloud-agent conventions).
- Prefer **narrow scopes**: touch only files needed for the task; avoid drive-by edits across unrelated paths.
- For broad codebase searches or multi-area exploration, use **parallel explore/general-purpose agents** via Task rather than serial grepping when it saves wall-clock time.
- **Credentials** belong in environment or secret stores, never in commits.

## Manual checks (static HTML)

To preview a game locally without changing the repo:

```bash
cd games/reaction-arena && python3 -m http.server 8080
```

Then open `http://127.0.0.1:8080/` in a browser.
