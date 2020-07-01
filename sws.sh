#!/bin/sh
#
# Author: Adrien Le Guillou

FORMAT="W:%W | %A - %T"

NAME="$(basename "$0")"
VERSION="0.1"
DESCRIPTION="Window switcher for Sway using dmenu"
HELP="$NAME $VERSION - $DESCRIPTION

Usage: $NAME [-h] [-f <format>]

Options:
    -h  display this help and exit
    -f  set the format for the window picker
            %O: Output (Display)
            %W: Workspace
            %A: Application
            %T: Window Title
        in addition, (container id) is appended at the end in order to identify the window
        default: $FORMAT "

while getopts f:h option
do
    case "${option}" in
        f) 
            FORMAT=${OPTARG}
            ;;
        h)
            echo "$HELP"
            exit
            ;;
    esac
done

# FORMAT as a `jq` concatenation string
FORMAT="$FORMAT (%I)"
FORMAT=$(echo "$FORMAT" | \
        sed  's/%O/" + .output + "/
              s/%W/" + .workspace + "/
              s/%A/" + .app_id + "/
              s/%T/" + .name + "/
              s/%I/" + .id + "/
              s/"/\"/
              s/\(.*\)/\"\1\"/')

# Get the container ID from the node tree
CON_ID=$(swaymsg -t get_tree | \
    jq -r ".nodes[] 
        | {output: .name, content: .nodes[]}
        | {output: .output, workspace: .content.name, 
          apps: .content 
            | .. 
            | {id: .id?|tostring, name: .name?, app_id: .app_id?} 
            | select(.app_id != null)}
        | {output: .output, workspace: .workspace, 
           id: .apps.id, app_id: .apps.app_id, name: .apps.name }
        | $FORMAT
        | tostring" | \
    dmenu -i -p "Window Switcher")

# Requires the actual `id` to be at the end and between paretheses
CON_ID=${CON_ID##*(}
CON_ID=${CON_ID%)}

# Focus on the chosen window
swaymsg [con_id=$CON_ID] focus


