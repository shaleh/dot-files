myexitstatus() {
    EXITSTATUS="$?"

    PROMPT="[\u@\h] \w:\n"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
       PS1="${PROMPT}$ "
    else
       PS1="${PROMPT}! "
    fi
}

PROMPT_COMMAND=myexitstatus
export PROMPT_COMMAND

EDITOR=~/bin/edit
export EDITOR
