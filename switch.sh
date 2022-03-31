#! /usr/bin/env bash

set -e

PLATFORM="$1"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

nix build --show-trace ".#darwinConfigurations.macbook.${PLATFORM}.system"
./result/sw/bin/darwin-rebuild switch --flake ".#macbook.${PLATFORM}"
