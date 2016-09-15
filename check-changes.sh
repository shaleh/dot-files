#!/bin/sh

diff -prub --exclude '*~' --exclude '.git' --exclude '*.elc' --exclude 'state' emacs.d ~/.emacs.d
diff -u ~/.gitconfig gitconfig
diff -prub config ~/.config
