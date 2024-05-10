function fish_prompt
    set -g __fish_git_prompt_showcolorhints true
    set -l last_status $status
    set -l stat

    if test $last_status -ne 0
        set stat (set_color red)" [$last_status]"(set_color normal)
    end

    printf "[%s %s]%s\n%s \$ " (prompt_login) (prompt_pwd --dir-length 3 --full-length-dirs 2) "$stat" (fish_git_prompt)
end
