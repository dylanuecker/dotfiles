if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	source /home/dylan/.env_vars
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
