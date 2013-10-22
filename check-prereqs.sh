#!/bin/sh

do_bin_check()
{
    which ${item} && test -x `which ${item}`
}

check_bin()
{
    item="$1"

    echo "${item}?"
    do_bin_check || missing_items
}

check_exists()
{
    item="$1"

    echo "${item}?"
    test -e "$item" || missing_items
}

do_common()
{
    check_bin "aspell"
    check_bin "dot"
    check_bin "gcc"
    check_bin "pwsafe"
}

do_linux()
{
    false
}

do_osx()
{
    check_exists "/Applications/Emacs.app"
    check_bin "brew"
}

fail()
{
    echo "$1"
    exit 1
}

missing_items()
{
    fail "missing items!!"
}

if [ -f ~/.sperry-no-prereqs ]; then
    echo "Skipping checks."
    exit 0
fi

do_common

case `uname -s` in
    Linux)
        do_linux
        ;;
    Darwin)
        do_osx
        ;;
    *)
        fail "Unknown OS"
        ;;
esac
