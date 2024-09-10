append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path "$HOME/.local/bin"

unset -f append_path

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	eval "$(ssh-agent -t 1h)"
	systemctl --user import-environment SSH_AUTH_SOCK
	export LIBSEAT_BACKEND=logind
	if [[ $HOST == "cloudbreak" ]]; then
		config="/home/dylan/.config/hypr/laptop.conf"
	else
		config="/home/dylan/.config/hypr/pc.conf"
	fi
	exec Hyprland -c $config
fi
