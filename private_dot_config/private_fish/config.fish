if status is-interactive
    function fish_command_not_found --on-event fish_command_not_found
        eval $(_PR_LAST_COMMAND="$argv" _PR_SHELL="fish" _PR_ALIAS="$(alias)" _PR_MODE="suggestion" "pay-respects")
    end

    function oops -d "Suggest fixes to the previous command"
        eval $(_PR_LAST_COMMAND="$(history | head -n 1)" _PR_ALIAS="$(alias)" _PR_SHELL="fish" "pay-respects")
    end
end
