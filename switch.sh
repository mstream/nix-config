#!/bin/bash

set -e -x

cd "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

nix flake update
nix run .#switch
