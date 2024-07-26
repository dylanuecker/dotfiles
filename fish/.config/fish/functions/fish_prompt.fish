function fish_prompt --description 'Left prompt'
    set -l last_pipestatus $pipestatus

    set -l pipestatus_string (__fish_print_pipestatus " [" "]" "|" (set_color --bold $fish_color_status) \
                             (set_color --bold $fish_color_status) $last_pipestatus)

    printf '%s%s@%s %s%s%s%s%s%s ' \
        (set_color --bold brblack) $USER (prompt_hostname) \
        (set_color --bold blue) (prompt_path) \
        (set_color --bold magenta) (fish_vcs_prompt) \
        $pipestatus_string \
        (set_color normal)
end

