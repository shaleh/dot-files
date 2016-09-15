#!/bin/sh

set +x

cp_or_diff()
{
    src=$1
    dest=$2

    if [ ! -x "$dest" ]; then
        cp "$src" "$dest"
    else
        diff -ub "$src" "$dest"
    fi
}

rsync -av --exclude '.git' emacs.d/ ~/.emacs.d/

cp_or_diff gitconfig ~/.gitconfig

[ -d ~/.config/git ] || mkdir -p ~/.config/git

cp_or_diff config/git/personal-settings ~/.config/git/personal-settings
