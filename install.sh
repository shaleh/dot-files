#!/bin/sh

set -e

cd "${HOME}"

is_command() {
    type "${1}" >/dev/null 2>&1
}

chezmoi=chezmoi
if is_command chezmoi; then
    chezmoi --version
elif is_command "${HOME}/.local/bin/chezmoi"; then
    chezmoi="${HOME}/.local/bin/chezmoi"
elif is_command "${HOME}/bin/chezmoi"; then
    chezmoi="${HOME}/bin/chezmoi"
elif is_command curl; then
    sh -c "$(curl -fsSL get.chezmoi.io/lb)"
    chezmoi="$HOME/.local/bin/chezmoi"
elif is_command wget; then
    sh -c "$(wget -qO- get.chezmoi.io/lb)"
    chezmoi="$HOME/.local/bin/chezmoi"
else
    echo "unable to install chezmoi" 1>&2
    exit 1
fi

${chezmoi} init --apply "shaleh/dot-files"
