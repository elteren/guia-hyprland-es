#!/usr/bin/env bash
# Alterna el auto-envio de juegos (.exe Wine/Proton y Steam) al workspace gaming
# y su auto-fullscreen inmersivo. Estado persistente en ~/.local/state/hypr/gaming-automove
STATE_FILE="$HOME/.local/state/hypr/gaming-automove"
mkdir -p "$(dirname "$STATE_FILE")"
if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "1" ]]; then
    printf '0' > "$STATE_FILE"; MSG="Auto-gaming: DESACTIVADO"
else
    printf '1' > "$STATE_FILE"; MSG="Auto-gaming: ACTIVADO"
fi
hyprctl notify -1 2500 "rgb(ffffff)" "$MSG"
hyprctl reload
