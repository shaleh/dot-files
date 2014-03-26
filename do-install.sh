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

cp_or_diff dot.emacs ~/.emacs
cp_or_diff ackrc ~/.ackrc

make -C emacs.d/site-lisp/haskell-mode all

rsync -av --exclude '.git' emacs.d/ ~/.emacs.d/

[ -d ~/.emacs.d/site-lisp/themes ] || mkdir ~/.emacs.d/site-lisp/themes
