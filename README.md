# sway_window_swithcher_dmenu

Simple window switcher for sway, inspired by rofi and using dmenu

## Usage

You can either execute the script from a terminal or by binding it to a key 
combination in sway.

```
sws.sh. 0.2 - Window switcher for Sway using dmenu

Usage: 
    sws.sh [-f | --format <format>] [-d | --dmenu-cmd <command>] 
          [-h | --help] [-v | --version]

Options:
    -d CMD, --dmenu-cmd CMD         [default: "dmenu"]
        set the `dmenu` command to use (ex "rofi -dmenu")

    -f FORMAT, --format FORMAT      [default: "W:%W | %A - %T"]
        set the format for the window picker
            %O: Output (Display)
            %W: Workspace
            %A: Application
            %T: Window Title
        (window_id) is appended at the end to identify the window

    -v, --version
        print version info and exit

    -h, --help      
        display this help and exit

Examples:
    # Default options work well if you have dmenu installed
    sws.sh

    # Use a different dmenu provider
    sws.sh --dmenu-cmd "wofi -d"

    # Add outputs name to the selector
    sws --format "[%O] W:%W | %A - %T"
```

## License

* MIT

## Requirements

* [jq](https://stedolan.github.io/jq/)
* dmenu (or a symlinked provider)

## Install

* Put the script somewhere in your $PATH
* Make the script executable `chmod +x sws.sh`
* (optional) bind it to key combination `bindsym $mod+semicolon exec sws.sh`








