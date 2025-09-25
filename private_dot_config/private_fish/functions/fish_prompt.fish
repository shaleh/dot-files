function chezmoi_prompt
    if test -z "$CHEZMOI_SUBSHELL"
        return
    else if test "$CHEZMOI_SUBSHELL" = 1
        echo (set_color blue)"[chezmoi]"(set_color normal)
    end
end

function fish_prompt
    set -g __fish_git_prompt_showcolorhints true
    set -l last_status $status
    set -l stat

    if test $last_status -ne 0
        set stat (set_color red)" [$last_status]"(set_color normal)
    end

    if test (id -u) -eq 0
        set login_part (prompt_login)
        set login_part_spacing " "
    else
        set login_part ""
        set login_part_spacing ""
    end

    printf "« %s%s%s »%s\n" \
        $login_part \
        $login_part_spacing \
        (prompt_pwd --dir-length 3 --full-length-dirs 2) \
        "$stat"
    echo (chezmoi_prompt) (fish_vcs_prompt) '| '
end
