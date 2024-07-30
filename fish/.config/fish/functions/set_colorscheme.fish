function set_colorscheme --description 'Set colorscheme'
    #
    # syntax highlighting variables
    #

    # default color
    set -U fish_color_normal normal

    # commands like echo
    set -U fish_color_command green

    # keywords like if - this falls back on the command color if unset
    #set -U fish_color_keyword

    # quoted text like "abc"
    set -U fish_color_quote yellow

    # IO redirections like >/dev/null
    set -U fish_color_redirection cyan

    # process separators like ; and &
    set -U fish_color_end magenta

    # syntax errors
    set -U fish_color_error red

    # ordinary command parameters
    set -U fish_color_param cyan

    # parameters that are filenames (if the file exists)
    set -U fish_color_valid_path white

    # options starting with “-”, up to the first “--” parameter
    #set -U fish_color_option

    # comments like ‘# important’
    set -U fish_color_comment yellow

    # selected text in vi visual mode
    set -U fish_color_selection white --bold --background=brblack

    # parameter expansion operators like * and ~
    set -U fish_color_operator brblue

    # character escapes like \n and \x70
    set -U fish_color_escape cyan

    # autosuggestions (the proposed rest of a command)
    set -U fish_color_autosuggestion brblack

    # the current working directory in the default prompt
    #set -U fish_color_cwd
    # the current working directory in the default prompt for the root user
    #set -U fish_color_cwd_root
    # the username in the default prompt
    #set -U fish_color_user
    # the hostname in the default prompt
    #set -U fish_color_host
    # the hostname in the default prompt for remote sessions (like ssh)
    #set -U fish_color_host_remote

    # the last command’s nonzero exit code in the default prompt
    #set -U fish_color_status

    # the ‘^C’ indicator on a canceled command
    set -U fish_color_cancel -r

    # history search matches and selected pager items (background only)
    set -U fish_color_search_match bryellow --background=brblack

    # the current position in the history for commands like dirh and cdh
    set -U fish_color_history_current --bold

    #
    # pager color variables
    #

    # the progress bar at the bottom left corner
    set -U fish_pager_color_progress brwhite --background=cyan

    # the background color of a line
    #set -U fish_pager_color_background

    # the prefix string, i.e. the string that is to be completed
    set -U fish_pager_color_prefix white --bold --underline

    # the completion itself, i.e. the proposed rest of the string
    set -U fish_pager_color_completion normal

    # the completion description
    set -U fish_pager_color_description yellow

    # background of the selected completion
    #set -U fish_pager_color_selected_background

    # prefix of the selected completion
    #set -U fish_pager_color_selected_prefix

    # suffix of the selected completion
    #set -U fish_pager_color_selected_completion

    # description of the selected completion
    #set -U fish_pager_color_selected_description

    # background of every second unselected completion
    #set -U fish_pager_color_secondary_background

    # prefix of every second unselected completion
    #set -U fish_pager_color_secondary_prefix

    # suffix of every second unselected completion
    #set -U fish_pager_color_secondary_completion

    # description of every second unselected completion
    #set -U fish_pager_color_secondary_description
end
