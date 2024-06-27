if status is-interactive
    # Commands to run in interactive sessions can go here

    source ~/.env
    source ~/.alias # TODO turn some of these into abbreviations?

    fish_vi_key_bindings insert
    bind -M insert -m default jk cancel repaint-mode
    set -g fish_sequence_key_delay_ms 200

    fzf_key_bindings

    # TODO dirstack? get cd - working
    # TODO pager color variables
    # TODO LIST_TYPES like option?

    # TODO better prompt
end
