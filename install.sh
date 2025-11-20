#!/bin/sh

# FIXME inline install.sh here instead of using curl | sh
# FIXME consider using packages to install chezmoi on deb and rpm-based systems

set -e

cd "${HOME}"

is_command() {
	type "${1}" >/dev/null 2>&1
}

if [ -n "${LOGNAME}" ]; then
	username="${LOGNAME}"
elif [ -n "${USER}" ]; then
	username="${USER}"
elif [ -n "${USERNAME}" ]; then
	username="${USERNAME}"
elif is_command whoami; then
	username="$(whoami)"
elif is_command logname; then
	username="$(logname)"
else
	printf "unable to determine username" 1>&2
	exit 1
fi

sudo=
if [ "${username}" != "root" ]; then
	sudo="sudo "
fi

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

shell="$(awk -F : "\$1 == \"${username}\" { print \$7 }" /etc/passwd)"
exec "${shell}"
