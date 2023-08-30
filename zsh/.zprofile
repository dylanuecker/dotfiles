if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	export LIBSEAT_BACKEND=logind
	exec Hyprland
fi
