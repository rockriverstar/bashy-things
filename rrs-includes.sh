#!/bin/sh
# rrs-includes.sh
# a few helper functions

# make sure we're running as bash, not sh
if [ -z "$BASH_VERSION" ]
then
    exec bash "$0" "$@"
fi

# colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# little function to echo a command as you do it
exe() { echo -e "${COL_YELLOW}$@${COL_RESET}" ; "$@" ; }

# little yes/no function
getyn () {
    while true; do
        echo -en "$1"
        read -p " (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * )
        esac
    done
}
