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
| `swift-hello-world` | Hello world program written in Swift |
| `zig-master` | Zig programming language (master/nightly build) |
| `zls-master` | Zig Language Server (master/nightly build) |
| `helix-master` | Helix text editor (master/nightly build) |

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

**Do not click the merge button.** Adding the `pr-pull` label is the merge mechanism -- it ensures bottles are published and the formula is updated atomically.

### `update.yml` — Auto-update zig-master, zls-master, and helix-master

Runs daily at 6am UTC (and on manual dispatch). The pipeline:

1. Checks ziglang.org for a new Zig nightly, tests it, then mirrors the binaries to a GitHub Release and updates the formula
2. Checks the ZLS master branch for new commits, cross-compiles for 4 targets (aarch64/x86_64 x macOS/Linux), publishes a GitHub Release, and updates the formula
3. ZLS is rebuilt when either its own source or the Zig version changes
4. Checks the Helix master branch for new commits, builds three targets (aarch64-macOS on `macos-26`; aarch64-linux and x86_64-linux inside an `ubuntu:26.04` container), publishes a GitHub Release, and updates the formula
