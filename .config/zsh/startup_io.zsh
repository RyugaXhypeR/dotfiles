# If `pokemon-colorscripts` is installed, run it to display a random image.
if command -v pokemon-colorscripts &>/dev/null; then
	pokemon-colorscripts --random --no-title
fi
