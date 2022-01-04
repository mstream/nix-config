#! /usr/bin/env bash

set -e

nix build
./result/sw/bin/darwin-rebuild switch --flake .#macbook
