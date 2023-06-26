# Helper variables and functions for my qtile config

################################## Variables ##################################

FONT = "Source Code Pro"
HOME_DIR = "/home/andrew"
MOD_KEY = "mod4" # super
TERMINAL = "alacritty"


################################## Functions ##################################

def parse_names(text: str) -> str:
    def remove_app_names(text: str):
        for string in [" — Mozilla Firefox", " - Brave", " – NVIM"]:
            if string in text:
                text = text.replace(string, "")
        return text

    def shorten_domain_names(text: str) -> str:
        ret_val = text
        if "Archive of Our Own" in text:
            ret_val = text.replace("Archive of Our Own", "AO3")
        elif "Ultimate-Guitar" in text:
            ret_val = text.replace("Ultimate-Guitar", "UG")
        elif "YouTube" in text:
            ret_val = text.replace("YouTube", "YT")

        return ret_val

    return remove_app_names(shorten_domain_names(text))
