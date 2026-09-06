# homebrew-tap — STATUS

**Updated:** 2026-09-06
**Branch:** main
**Content identity:** sha256:a0efa663aea432de31c2e5342aa99fe439b19fb0ec0b4dc2936ce92451f28b53 (indexed paths, working-tree bytes; excludes STATUS.md and untracked files; stage additions first)
**Tree:** DIRTY

## Current goal

Keep the tap's two formulae (`coding-control-tower` v0.1.0, `tmux-llm-dashboard` v0.2.0 — latest commit `92f05aa`) strict-audit clean and installed from this tap.

## Latest verified evidence

- `brew audit --strict mohan-n-swamy/tap/tmux-llm-dashboard` → exit 0 in 1:03, no findings. (Path form `brew audit [path ...]` is disabled; the tap clone at `~/Library/Taps/mohan-n-swamy/homebrew-tap` carries the same v0.2.0 tarball URL as this working tree's `Formula/tmux-llm-dashboard.rb:4`.)
- `brew style ./Formula/tmux-llm-dashboard.rb` (working-tree file, this session) → exit 0, "1 file inspected, no offenses detected".

## Blocker

_none_

## Next action

- [ ] Run `~/.agents/golden-rules/doctrine-check.sh` and record the result under "Last mechanical check" in `DOCTRINE.md` (still reads "**2026-08-21** — not yet run"; all eight baseline rows are `unknown`).

---
_Stage intended new files with `git add -- <paths>` before refreshing with `bin/gen-status.rb homebrew-tap` for /save, /park, /wrap-up. Use `--allow-untracked` only for unrelated scratch. Machine header (Updated/Branch/Content identity/Tree) is auto-filled; the prose is yours._
