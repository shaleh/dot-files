function fish_prompt
    set -g __fish_git_prompt_showcolorhints true
    printf "[%s@%s %s]\n%s \$ " (whoami) (hostname) (prompt_pwd) (fish_git_prompt)
end
