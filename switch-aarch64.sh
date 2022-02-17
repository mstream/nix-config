#! /usr/bin/env bash

set -e

darwin-rebuild switch --flake .#macbook.aarch64-darwin
