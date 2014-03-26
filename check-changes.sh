#!/bin/sh

diff -pruNb --exclude '*~' --exclude '.git' --exclude '*.elc' --exclude 'state' ~/.emacs.d emacs.d
diff -ub ~/.emacs dot.emacs
diff -ub ~/.ackrc ackrc
