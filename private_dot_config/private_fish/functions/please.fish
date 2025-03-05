function please -d "Re-run command with sudo."
    set -l needs_permission $history[1]

    if ! test -z "$needs_permission"
        eval "sudo $needs_permission"
    end
end
