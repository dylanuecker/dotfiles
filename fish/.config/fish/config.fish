if status is-interactive
    # Commands to run in interactive sessions can go here

    source ~/.abbr
    source ~/.env

    if test -e ~/.localrc
        source ~/.localrc
    end

    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    alias ip='ip -color=auto'

    alias la='ls --almost-all'
    alias ll='ls -l --human-readable'
    alias lla='ll --almost-all'

    export LESS_TERMCAP_mb=(tput bold; tput setaf 1)                # blinking (red)
    export LESS_TERMCAP_md=(tput bold; tput setaf 2)                # bold (green)
    export LESS_TERMCAP_me=(tput sgr0)                              # end mode (reset all)
    export LESS_TERMCAP_so=(tput setaf 0; tput setab 255)           # standout-mode (black on white)
    export LESS_TERMCAP_se=(tput sgr0)                              # end standout-mode (reset all)
    export LESS_TERMCAP_us=(tput smul; tput bold; tput setaf 5)     # underline (purple)
    export LESS_TERMCAP_ue=(tput sgr0)                              # end underline (reset all)

    fish_vi_key_bindings insert
    bind -M insert -m default jk repaint-mode
    set -g fish_sequence_key_delay_ms 200

    fzf_key_bindings

    bind -M insert \e\[13\;2u accept-autosuggestion # shift + enter
    bind -M default \e\[13\;2u accept-autosuggestion # shift + enter

    set -g fish_greeting

    # cd -/+ like zsh would be nice
    # dirh/cdh/prevd/nextd
    # dirs/pushd/popd

    # TODO pager (tab completion) color variables
    # TODO LIST_TYPES like option?
    # TODO better prompt
end
