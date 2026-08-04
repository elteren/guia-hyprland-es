#!/usr/bin/env bash
state=$(hyprctl getoption general:allow_tearing -j | grep -oP '"bool":\s*\K\w+')
if [ "$state" = "true" ]; then
    hyprctl eval 'hl.config({ general = { allow_tearing = false } })'
    notify-send "Tearing OFF" "vsync/espera activa"
else
    hyprctl eval 'hl.config({ general = { allow_tearing = true } })'
    notify-send "Tearing ON" "baja latencia, posible corte visual"
fi
