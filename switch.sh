#! /usr/bin/env bash

set -e

PLATFORM="$1"

nix build ".#darwinConfigurations.macbook.${PLATFORM}.system"
./result/sw/bin/darwin-rebuild switch --flake ".#macbook.${PLATFORM}"
