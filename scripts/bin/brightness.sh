#!/bin/sh

brightness_path="/sys/class/backlight/intel_backlight/brightness"
current_brightness=0

increase_brightness() {
    set_current_brightness
    echo "$((current_brightness + $1))" | tee $brightness_path
}

decrease_brightness() {
    set_current_brightness
    echo "$((current_brightness - $1))" | tee $brightness_path
}

get_brightness() {
    set_current_brightness
    echo "[$(cat $brightness_path)]"
}

set_current_brightness() {
    current_brightness="$(cat $brightness_path)"
}

while getopts 'gi:d:' flag; do
    case "${flag}" in
        g) get_brightness ;;
        i) increase_brightness "${OPTARG}" ;;
        d) decrease_brightness "${OPTARG}" ;;
        *) error "Unknown argument ${flag}"; exit 3 ;;
    esac
done
