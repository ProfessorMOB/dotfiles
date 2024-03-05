# automator -i ~/Centralized\ Personal\ Folder/MacOS\ Wallpapers/$(python3.12 default_wp.py ~/.config/themes.json) ~/.config/set_desktop_pic.workflow

while [ true ]; do
	automator -i ~/Centralized\ Personal\ Folder/MacOS\ Wallpapers/$(fswatch ~/.config/themes.json | python3.12 default_wp.py) ~/.config/set_desktop_pic.workflow
	sleep 100
done
