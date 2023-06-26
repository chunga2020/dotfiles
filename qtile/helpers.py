# Helper variables and functions for my qtile config

################################## Variables ##################################

FONT = "Source Code Pro"
HOME_DIR = "/home/andrew"
MOD_KEY = "mod4" # super
TERMINAL = "alacritty"


################################## Functions ##################################

def remove_app_names(text: str):
    for string in [" — Mozilla Firefox", " - NVIM"]:
        text = text.replace(string, "")
        return text
