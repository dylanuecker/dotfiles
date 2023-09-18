if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	eval "$(ssh-agent -t 1h)"
	export LIBSEAT_BACKEND=logind
	if [[ $HOST == "cloudbreak" ]]; then
		config="/home/dylan/.config/hypr/laptop.conf"
	else
		config="/home/dylan/.config/hypr/pc.conf"
	fi
	exec Hyprland -c $config
fi
