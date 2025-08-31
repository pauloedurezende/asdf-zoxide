<div align="center">

# asdf-zoxide [![Build](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/build.yml/badge.svg)](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/build.yml) [![Lint](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/lint.yml/badge.svg)](https://github.com/pauloedurezende/asdf-zoxide/actions/workflows/lint.yml)

[zoxide](https://github.com/ajeetdsouza/zoxide/wiki) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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

# Set a version globally (on your ~/.tool-versions file)
asdf global zoxide latest

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
