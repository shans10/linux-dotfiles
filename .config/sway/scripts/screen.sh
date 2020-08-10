#!/usr/bin/env bash
IFS=$'\n'

usage() {
	cat >&2 << EOF
$(basename "$0") [ -w | -s | -d ] [ FILE ]

Take a screenshot

	-w    screenshot current active window
	-s    screenshot selection
	-d    screenshot display (default)
	-h    show this help
	FILE  destination for screenshot

The last provided flag before [ FILE ] will be used,
or display by default.
EOF
}

# === ENVIRONMENT VARIABLES ===
# using xdg-open is a good second guess
# simply set $XIVIEWER in .xinitrc / .profile to change
viewer=${XIVIEWER:-xdg-open}
editor=${XIEDITOR:-gimp}
tmpdir="${SCREENSHOT_TMPDIR:=${TMPDIR:=${XDG_RUNTIME_DIR:-/tmp}}}/screenshots"
ssdir=${SCREENSHOT_DIRECTORY:-$HOME/Pictures/Screenshots}

# === GETOPTS ===
# if no opt provided, don't shift
opt=d
while getopts ":dhsw" o; do
	case "$o" in
	[dsw]) opt="$o" ;;
	h ) usage && exit 0 ;;
	* ) usage && exit 1 ;;
	esac
done
shift $(( OPTIND - 1 ))

# === IMAGE LOCATION ===
if (( $# )); then
	# create path if it doesn't exist
	mkdir -p "$(dirname "$1")"
	img="$1"
else
	mkdir -p "$tmpdir"
	img=$(mktemp "${tmpdir}/$(date +%Y-%m-%d_%T).XXX" --suffix=.png)
fi

# === TAKE SCREENSHOT ===
case $opt in # active window / selection / whole screen
	w)
		x="$(swaymsg -t get_tree | jq -r \
			'.nodes[].nodes[]|select(.name!="__i3_scratch")|
			.floating_nodes[],recurse(.nodes[])|select(.focused)|.rect|
			(.x|tostring)+","+(.y|tostring)+" "+(.width|tostring)+"x"+(.height|tostring)'
		)"
		grim -g "${x%%*$'\n'}" "$img"
	;;
	s) grim -g "$(slurp)" "$img" ;;
	d) grim "$img" ;;
esac

# === TAKE ACTION ON FILE ===
# in a loop, user may want to take many actions
while
action="$(zenity --title="[Grim] Took screenshot: $img" --width=600 --height=300 --list \
	--column='Command' --column='Choose an action:' <<- EOF
	wl-copy < "\$img"
	Copy image to clipboard
	rm "\$img"; break
	Delete image and exit
	$viewer "\$img"
	View image with $viewer
	$editor "\$img"
	Edit image with $editor
	mkdir -p "\$ssdir"; cp "\$img" "\$ssdir"
	Save image to $ssdir
	imgur -a "\$img"
	Upload image to Imgur
EOF
)"
do
	eval "$action"
done
