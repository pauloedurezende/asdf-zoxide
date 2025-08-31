<div align="center">

# asdf-zoxide [![Build](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/build.yml/badge.svg)](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/build.yml) [![Lint](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/lint.yml/badge.svg)](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/lint.yml)

[zoxide](https://github.com/ajeetdsouza/zoxide) plugin for the [asdf version manager](https://asdf-vm.com).

A smarter cd command that remembers frequently used directories.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html)

**Note:** This plugin downloads pre-compiled binaries from zoxide releases, making installation fast with no build dependencies required.

# Install

Plugin:

```shell
asdf plugin add zoxide
# or
asdf plugin add zoxide https://github.com/pauloedurezende/asdf-zoxide.git
```

zoxide:

```shell
# Show all installable versions
asdf list-all zoxide

# Install specific version
asdf install zoxide latest

# Show installed versions
asdf list zoxide

# Set a version globally (in your home ~/.tool-versions file)
asdf set -u zoxide latest

# Now zoxide commands are available
zoxide --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/pauloedurezende/asdf-zoxide/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Paulo Eduardo Rezende](https://github.com/pauloedurezende/)
