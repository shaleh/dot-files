#!/bin/sh

diff -prub --exclude '*~' --exclude '.git' --exclude '*.elc' --exclude 'state' emacs.d ~/.emacs.d
diff -u ~/.gitconfig gitconfig

for d in config/*
do
    diff -prub $d ~/.$d
done
