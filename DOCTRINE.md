# Doctrine baseline — homebrew-tap

Compliance record for `~/.agents/golden-rules/`. Baseline set **2026-08-21**.

Per the compliance model: new work complies from the first commit · this baseline
may not get worse · surfaces you touch come into compliance · the nine mandatory
gates apply regardless of what is written below.

## Baseline

Mark each: `compliant` · `exception` · `unknown`. An exception needs a reason,
an owner, and a date. `unknown` is honest and allowed; it is not a free pass.

| Doctrine | Status | Reason / owner / date |
|---|---|---|
| 1 · Product and PRD | unknown | |
| 2 · Engineering and code | unknown | |
| 3 · UI and UX | unknown | |
| 4 · Testing and iteration | unknown | |
| 5 · Deploy, scale, maintain | unknown | |
| 6 · Docs and handover | unknown | |
| 7 · AI usage and prompts | unknown | n/a if this project makes no model calls |
| 8 · Integrations | unknown | n/a if this project calls no external service |

## Mandatory gates — always, regardless of baseline

| Gate | Status | Note |
|---|---|---|
| Secrets handling | | |
| Destructive operations | | |
| Database migrations | | |
| Authorization | | |
| External writes | | |
| Production deploys | | |
| Money arithmetic | | n/a if this project handles no money |
| Personal data | | n/a if this project holds no personal data |
| What is sent to an LLM provider | | n/a if this project makes no model calls |

## Declared exceptions

| Rule ID | Why | Owner | Declared | Revisit |
|---|---|---|---|---|
| | | | | |

## Last mechanical check

Run `~/.agents/golden-rules/doctrine-check.sh` and record the result:

- **2026-08-21** — not yet run
