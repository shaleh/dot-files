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
    printf "« %s%s%s »%s\n%s \$ " $login_part $login_part_spacing (prompt_pwd --dir-length 3 --full-length-dirs 2) "$stat" (fish_git_prompt)
end
