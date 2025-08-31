#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/ajeetdsouza/zoxide"
TOOL_NAME="zoxide"
TOOL_TEST="zoxide --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

get_os() {
	case "$(uname -s)" in
	Darwin) echo "apple-darwin" ;;
	Linux) echo "unknown-linux-musl" ;;
	*) fail "Unsupported operating system: $(uname -s)" ;;
	esac
}

get_arch() {
	local arch
	arch="$(uname -m)"
	case "$arch" in
	x86_64) echo "x86_64" ;;
	aarch64 | arm64) echo "aarch64" ;;
	*) fail "Unsupported architecture: $arch" ;;
	esac
}

get_platform() {
	local os arch
	os="$(get_os)"
	arch="$(get_arch)"
	echo "${arch}-${os}"
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url platform
	version="$1"
	filename="$2"
	platform="$(get_platform)"

	url="$GH_REPO/releases/download/v${version}/zoxide-${version}-${platform}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version for platform $platform..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"

		# Copy the zoxide binary from download path
		if [ -f "$ASDF_DOWNLOAD_PATH/zoxide" ]; then
			cp "$ASDF_DOWNLOAD_PATH/zoxide" "$install_path/zoxide"
			chmod +x "$install_path/zoxide"
		else
			fail "Expected zoxide binary not found in $ASDF_DOWNLOAD_PATH"
		fi

		# Verify the installation
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
