# sway_window_swithcher_dmenu"

Simple window switcher for sway, inspired by rofi and using dmenu

## Usage

You can either execute the script from a terminal or by binding it to a key 
combination in sway.

```
sws.sh. 0.1 - Window switcher for Sway using dmenu

Usage: 
    sws.sh [-h] [-f <format>] [-d <dmenu command>]

Options:
    -h display this help and exit
    -d `dmenu` command (ex "rofi -dmenu")
       (default: "dmenu")
    -f set the format for the window picker
            %O: Output (Display)
            %W: Workspace
            %A: Application
            %T: Window Title
        in addition, (container id) is appended at the end in order to identify the window
        default: W:%W | %A - %T 
```

## License

* MIT

## Requirements

* [jq](https://stedolan.github.io/jq/)
* dmenu (or a symlinked provider)

## Install

* Put the script somewhere in your $PATH
* (optional) bind it to key combination `bindsym $mod+semicolon exec sws.sh`


