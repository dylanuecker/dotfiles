function fish_prompt --description 'Left prompt'
    set -l last_pipestatus $pipestatus
    set -l pipestatus_string (__fish_print_pipestatus " [" "]" "|" (set_color --bold $fish_color_status) \
                             (set_color --bold $fish_color_status) $last_pipestatus)

    set -l git_prompt_output (string replace -ra '\(|\)' '' (fish_git_prompt))

    printf '%s%s%s%s%s%s%s' \
        (set_color --bold blue) (prompt_path) \
        (set_color --bold brblack) $git_prompt_output \
        $pipestatus_string \
        (set_color --bold yellow) " > "\
        (set_color normal)
end

