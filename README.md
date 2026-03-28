# homebrew-formulae

Custom Homebrew tap with formulae for tools not available in homebrew-core.

## Install

```bash
brew tap ataias/formulae
brew install <formula>
```

## Available formulae

| Formula | Description |
|---|---|
| `pijul` | Distributed version control system based on a theory of patches |
| `swift-hello-world` | Hello world program written in Swift |

## CI workflows

Three GitHub Actions workflows manage formula testing, bottle publishing, and auto-updates.

### `tests.yml` — Build and test

Runs on every push to `main` and on pull requests. Uses `brew test-bot` to:

1. Check tap syntax and style
2. Build bottles on macOS arm64 (on PRs only)
3. Upload bottle artifacts

### `publish.yml` — Publish bottles

Triggered when a PR receives the `pr-pull` label. Runs `brew pr-pull` which:

1. Downloads bottle artifacts from the PR's test run
2. Uploads bottles to GitHub Releases
3. Updates the formula's `bottle` block
4. Pushes directly to `main` (closing the PR)

**Do not click the merge button.** Adding the `pr-pull` label is the merge mechanism — it ensures bottles are published and the formula is updated atomically.

### `update.yml` — Auto-update pijul

Runs daily at 6am UTC (and on manual dispatch). Checks crates.io for a new version of pijul and creates a PR via `brew bump-formula-pr` if one is found.

### Typical flow for an update

```
Daily cron detects new version
  -> update.yml creates a PR
  -> tests.yml builds bottles on the PR
  -> Maintainer adds "pr-pull" label
  -> publish.yml uploads bottles and pushes to main
```
