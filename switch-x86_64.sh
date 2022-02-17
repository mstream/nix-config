#! /usr/bin/env bash

set -e

darwin-rebuild switch --flake .#macbook.x86_64-darwin
