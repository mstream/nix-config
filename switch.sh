#! /usr/bin/env bash

set -e -E

PLATFORM="$1"
HOMEBREW_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

bash -c "$(curl -fsSL ${HOMEBREW_INSTALL_SCRIPT_URL})"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

nix build \
	--experimental-features 'nix-command flakes' \
	--show-trace \
	".#darwinConfigurations.macbook.${PLATFORM}.system"

./result/sw/bin/darwin-rebuild switch --flake ".#macbook.${PLATFORM}"
