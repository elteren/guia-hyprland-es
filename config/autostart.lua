-- Programas al iniciar sesion
-- Si no usas UWSM, agrega aqui tus programas de autostart; si usas UWSM, usa XDG autostart: https://wiki.archlinux.org/title/XDG_Autostart
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): noctalia wl-clip-persist easyeffects power-profiles-daemon xorg-xhost
-- AUR: pipeweaver
-- dbus-update-activation-environment es parte del sistema (dbus), no requiere instalacion.

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all") -- Aplicar las variables de entorno al daemon de DBus (del sistema, sin instalar)
    hl.exec_cmd("noctalia") -- Lanzar Noctalia (panel y barra) -- Requiere: noctalia
    hl.exec_cmd("xhost +SI:localuser:root") -- Permitir acceso a apps lanzadas como root -- Requiere: xorg-xhost
    hl.exec_cmd("wl-clip-persist --clipboard regular &") -- Mantener el portapapeles tras cerrar la app -- Requiere: wl-clip-persist
    hl.exec_cmd("pipeweaver-daemon &") -- Daemon de PipeWeaver (eventos de audio) -- Requiere: pipeweaver (AUR)
    hl.exec_cmd("easyeffects &") -- Ecualizador de audio EasyEffects -- Requiere: easyeffects
    hl.exec_cmd("powerprofilesctl set performance &") -- Perfil de energia: rendimiento -- Requiere: power-profiles-daemon
end)
