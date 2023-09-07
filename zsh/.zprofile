if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	eval "$(ssh-agent -t 1h)"
	export LIBSEAT_BACKEND=logind
	exec Hyprland
fi
