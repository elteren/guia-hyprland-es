-- Atajos de teclado y mouse, agrupados por funcion.
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): noctalia uwsm kitty dolphin firefox gnome-text-editor
--                    gnome-calculator btop hyprpicker grim wl-clipboard
-- AUR: (ninguno)
-- Custom: script propio ~/.local/bin/tearing-toggle.sh

local mainMod = "SUPER"
local noctCall = "noctalia msg " -- Requiere: noctalia
local launchPrefix = "uwsm app -- " -- Requiere: uwsm. Si no usas UWSM, dejalo vacio ("")

-- ══ VENTANAS ══

-- Cerrar (forzado)
hl.bind(mainMod .. " + Escape",      hl.dsp.exec_cmd("hyprctl kill"))
-- Cerrar ventana activa
hl.bind(mainMod .. " + Q",           hl.dsp.window.close())
-- Alternar flotante
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
-- Maximizar (modo 1)
hl.bind(mainMod .. " + D",           hl.dsp.window.fullscreen({ mode = "maximized" }))
-- Pantalla completa
hl.bind(mainMod .. " + F",           hl.dsp.window.fullscreen())
-- Mover ventana en columna
hl.bind(mainMod .. " + J",           hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + K",           hl.dsp.layout("move -col"))

-- Intercambiar columnas (layout scrolling)
hl.bind(mainMod .. " + CONTROL + H",      hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CONTROL + L",      hl.dsp.layout("swapcol r"))
-- Consumir/expulsar ventana (layout scrolling)
hl.bind(mainMod .. " + SHIFT + H",        hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + SHIFT + L",        hl.dsp.layout("consume_or_expel next"))

-- Enfocar ventana (layout scrolling: mueve el foco y centra la vista)
hl.bind(mainMod .. " + Left",  hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + Right", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + Up",    hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + Down",  hl.dsp.layout("focus d"))
-- Siguiente ventana (ciclo)
hl.bind("ALT + Tab",           hl.dsp.window.cycle_next())
-- Alternador de ventanas (Noctalia)
hl.bind(mainMod .. " + Tab",   hl.dsp.exec_cmd(noctCall .. "window-switcher")) -- Requiere: noctalia

-- Mover ventana (direccion)
hl.bind(mainMod .. " + SHIFT + Up",                   hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Right",                hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left",                 hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Down",                 hl.dsp.window.move({ direction = "d" }))
-- Mover ventana a un workspace
hl.bind(mainMod .. " + SHIFT + 1",                    hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind(mainMod .. " + SHIFT + 2",                    hl.dsp.window.move({ workspace = 2, follow = true }))
hl.bind(mainMod .. " + SHIFT + 3",                    hl.dsp.window.move({ workspace = 3, follow = true }))
hl.bind(mainMod .. " + SHIFT + 4",                    hl.dsp.window.move({ workspace = 4, follow = true }))
hl.bind(mainMod .. " + SHIFT + 5",                    hl.dsp.window.move({ workspace = 5, follow = true }))
-- Mover ventana a otro monitor
hl.bind(mainMod .. " + SHIFT + mouse_up",             hl.dsp.window.move({ monitor   = "-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down",           hl.dsp.window.move({ monitor   = "+1" }))
-- Mover ventana al workspace adyacente
hl.bind(mainMod .. " + CONTROL + SHIFT + Right",      hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left",       hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_up",   hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "m+1" }))
-- Mover ventana al workspace relativo (m~1 .. m~NUM_WPM)
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + CONTROL + " .. key, hl.dsp.window.move({ workspace = "m~" .. i }))
end

-- Arrastrar / redimensionar con el mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Centrar la ventana flotante enfocada
hl.bind(mainMod .. " + B",         hl.dsp.window.center())

--- Alternar flotante + fullscreen de la ventana enfocada
hl.bind(mainMod .. " + T", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))      -- Alternar flotante
    hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" })) -- Alternar fullscreen
end) -- Alternar flotante y fullscreen de la ventana enfocada

-- ══ APPS ══

-- Terminal
hl.bind(mainMod .. " + Return",     hl.dsp.exec_cmd(launchPrefix .. TERMINAL)) -- Requiere: uwsm, kitty
-- Archivos (dolphin)
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER)) -- Requiere: uwsm, dolphin

-- Calculadora
hl.bind(mainMod .. " + C",          hl.dsp.exec_cmd(launchPrefix .. CALCULATOR)) -- Requiere: uwsm, gnome-calculator
hl.bind("XF86Calculator",           hl.dsp.exec_cmd(launchPrefix .. CALCULATOR)) -- Requiere: uwsm, gnome-calculator
-- Navegador (chromium predeterminado, firefox secundario)
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd(launchPrefix .. BROWSER)) -- Requiere: uwsm, chromium (BROWSER)
hl.bind(mainMod .. " + SHIFT + W",  hl.dsp.exec_cmd(launchPrefix .. "firefox")) -- Requiere: uwsm, firefox (secundario)
-- Monitor del sistema (btop)
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop")) -- Requiere: uwsm, kitty, btop
-- Ajustes de Noctalia
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd(noctCall .. "settings-toggle")) -- Requiere: noctalia
-- Centro de control
hl.bind(mainMod .. " + X",          hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center")) -- Requiere: noctalia
-- Lanzador de apps
hl.bind(mainMod .. " + Space",      hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher")) -- Requiere: noctalia
-- Lanzador de emojis
hl.bind(mainMod .. " + period",     hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo")) -- Requiere: noctalia
-- Bloquear sesion
hl.bind(mainMod .. " + L",          hl.dsp.exec_cmd(noctCall .. "session lock")) -- Requiere: noctalia
-- Panel de sesion
hl.bind(mainMod .. " + ALT + C",    hl.dsp.exec_cmd(noctCall .. "panel-toggle session")) -- Requiere: noctalia

-- ══ HARDWARE (audio, media, brillo) ══

-- Volumen: subir / bajar
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"),   { locked = true, repeating = true }) -- Requiere: noctalia
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true }) -- Requiere: noctalia
-- Volumen: silenciar
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true }) -- Requiere: noctalia
-- Microfono: silenciar
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(noctCall .. "mic-mute"),    { locked = true }) -- Requiere: noctalia

-- Media: reproducir / pausar
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true }) -- Requiere: noctalia
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"),   { locked = true }) -- Requiere: noctalia
-- Media: siguiente / anterior
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(noctCall .. "media next"),     { locked = true }) -- Requiere: noctalia
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true }) -- Requiere: noctalia

-- Brillo: subir / bajar
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(noctCall .. "brightness-up"),   { locked = true, repeating = true }) -- Requiere: noctalia
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true }) -- Requiere: noctalia

-- ══ UTILIDADES ══

-- Seleccionar color
hl.bind(mainMod .. " + P",     hl.dsp.exec_cmd("hyprpicker -a -n")) -- Requiere: hyprpicker
-- Captura de region
hl.bind("Print",               hl.dsp.exec_cmd(noctCall .. "screenshot-region")) -- Requiere: noctalia
-- Captura de pantalla completa (guardar + copiar al portapapeles)
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("sh -c 'f=\"$HOME/Imágenes/capturas/shot-$(date +%Y%m%d-%H%M%S).png\"; mkdir -p \"${f%/*}\"; grim -o HDMI-A-1 \"$f\" && wl-copy --type image/png < \"$f\"'")) -- Requiere: grim, wl-clipboard
-- Alternar tearing (baja latencia para juegos competitivos)
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("bash ~/.local/bin/tearing-toggle.sh")) -- Requiere: script ~/.local/bin/tearing-toggle.sh
-- Panel de fondos de pantalla (movido de SHIFT+W para dejar sitio a firefox secundario)
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper")) -- Requiere: noctalia (antes SUPER+SHIFT+W)
-- Portapapeles
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard")) -- Requiere: noctalia, cliphist (historial)
-- Notificaciones
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications")) -- Requiere: noctalia

-- ══ WORKSPACES Y MONITORES ══

-- Ir al workspace N (1-5)
for i = 1, 5 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Ir al workspace relativo (m~1 .. m~NUM_WPM)
for i = 1, NUM_WPM do
    local key = i % 10
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = "m~" .. i }))
end

-- Workspace adyacente / siguiente vacio en el monitor
hl.bind(mainMod .. " + CONTROL + Right",       hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + Left",        hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + Down",        hl.dsp.focus({ workspace = "emptym" }))

-- Cambiar workspace con la rueda del mouse
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + CONTROL + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }))

-- Enviar ventana al scratchpad (workspace special)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
-- Alternar scratchpad
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special())
