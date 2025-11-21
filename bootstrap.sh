#!/bin/sh

set -e

cd "$(chezmoi source-path)"

if [ "$(uname -o)" = "Darwin" ]; then
	echo "Running bootstrap for Darwin"
    ./bootstrap-darwin.sh
elif [ -f "/etc/debian-version" ]; then
	echo "Running bootstrap for Debian"
	./bootstrap-debian.sh
else
	echo "No bootstrap to run"
fi
