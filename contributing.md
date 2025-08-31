# Contributing

## Prerequisites

Before testing locally, make sure you have:

- **asdf** installed and configured
- Basic development tools: `bash`, `curl`, `tar`

## Testing Locally

```shell
asdf plugin test zoxide <path-to-plugin> --asdf-tool-version 0.9.8 "zoxide --version"
```

**Note:** This plugin downloads pre-compiled binaries, so testing is fast with no compilation required.

Tests are automatically run in GitHub Actions on push and PR.
