import json
import os

#"$HOME/.config/themes.json"

path = input()

themes = json.load(open(os.path.expandvars(path), "r"))

print(themes["wallpapers"][themes["default"]])
