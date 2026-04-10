# homebrew-supersigil

Homebrew tap for [supersigil](https://github.com/jonisavo/supersigil), a CLI tool and verification framework for spec-driven development.

## Install

```sh
brew install jonisavo/supersigil/supersigil
```

Or tap first, then install:

```sh
brew tap jonisavo/supersigil
brew install supersigil
```

This installs both `supersigil` (CLI) and `supersigil-lsp` (language server).

## Update

```sh
brew upgrade supersigil
```

## Platforms

Pre-built binaries are available for:

- macOS (Apple Silicon and Intel)
- Linux (x86_64 and aarch64, statically linked with musl)

## Other installation methods

- **Arch Linux:** `supersigil-bin` on the [AUR](https://aur.archlinux.org/packages/supersigil-bin)
- **From source:** `cargo install supersigil-cli supersigil-lsp`
- **Pre-built binaries:** [GitHub Releases](https://github.com/jonisavo/supersigil/releases)
