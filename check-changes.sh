#!/bin/sh

diff -prub --exclude '*~' --exclude '.git' --exclude '*.elc' --exclude 'state' ~/.emacs.d emacs.d
diff -ub ~/.ackrc ackrc
