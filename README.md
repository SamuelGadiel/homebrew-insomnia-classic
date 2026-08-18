# homebrew-insomnia-classic

Homebrew tap that keeps Insomnia pinned to version `2023.5.8`, the last
release before the 8.0.0 update that everybody hates.

## Installation

```sh
brew tap samuelgadiel/insomnia-classic
brew install --cask insomnia-classic
```

If you already have the official `insomnia` cask installed, remove it first
(both casks target `/Applications/Insomnia.app`):

```sh
brew uninstall --cask insomnia
```

## Important: disable the app's own auto-updater

Insomnia has a built-in updater that runs independently of Homebrew. After
installing, go to **Preferences → General** and uncheck **"Automatically
update"** — otherwise the app will update itself to a newer version and
defeat the purpose of this cask.

## Why this cask exists

Starting with version 8.0.0, Insomnia changed significantly: it requires
login, moved to a tab-based UI, redesigned collections, and added built-in
AI features. This cask keeps the last version before those changes available.

## Version updates

This cask is **intentionally pinned** (`livecheck` with `skip`) and should
not be autobumped. Any version bump here is a manual decision.
