# Custom function that does prefix search, the original search is still
# available with `<C-p>`
# Problem with these is that the first result is the same as autocomplete
bind -k up up-or-prefix-search
bind \e\[A up-or-prefix-search
bind -k down down-or-prefix-search
bind \e\[B down-or-prefix-search
