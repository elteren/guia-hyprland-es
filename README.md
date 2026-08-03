# Configuracion Hyprland v0.56.1

Configuracion de Hyprland para CachyOS usando UWSM y Lua.

## Requisitos

- **Official**: kitty dolphin firefox gnome-text-editor gnome-calculator
- **AUR**: (ninguno)
- **Custom**: script propio `~/.local/bin/tearing-toggle.sh`
- **Extras**: noctalia, uwsm, hyprpicker, grim, wl-clipboard, cliphist

## Atajos de teclado (binds.lua)

Convencion: `SUPER` = tecla super (Windows), `CONTROL` = Ctrl, `ALT` = Alt.

### VENTANAS

| Atajo | Accion |
|---|---|
| `SUPER + Escape` | Cerrar ventana (forzado) |
| `SUPER + Q` | Cerrar ventana activa |
| `SUPER + ALT + Space` | Alternar flotante |
| `SUPER + D` | Maximizar (modo 1) |
| `SUPER + F` | Pantalla completa |
| `SUPER + T` | Alternar flotante + fullscreen de la ventana enfocada |
| `SUPER + J` / `SUPER + K` | Mover ventana en columna |
| `SUPER + CONTROL + H` / `SUPER + CONTROL + L` | Intercambiar columnas |
| `SUPER + SHIFT + H` / `SUPER + SHIFT + L` | Consumir/expulsar ventana |
| `SUPER + Flechas` | Enfocar ventana |
| `ALT + Tab` | Siguiente ventana (ciclo) |
| `SUPER + Tab` | Alternador de ventanas (Noctalia) |
| `SUPER + SHIFT + Flechas` | Mover ventana en direccion |
| `SUPER + SHIFT + 1..5` | Mover ventana a un workspace |
| `SUPER + SHIFT + mouse_up/down` | Mover ventana a otro monitor |
| `SUPER + CONTROL + SHIFT + Flechas / mouse` | Mover ventana al workspace adyacente |
| `SUPER + SHIFT + CONTROL + 0..9` | Mover ventana al workspace relativo |
| `SUPER + mouse:272` / `SUPER + mouse:273` | Arrastrar / redimensionar con el mouse |

### APPS

| Atajo | Accion |
|---|---|
| `SUPER + Return` | Terminal (kitty) |
| `SUPER + E` | Gestor de archivos (dolphin) |
| `SUPER + C` / `XF86Calculator` | Calculadora (gnome-calculator) |
| `SUPER + W` | Navegador (firefox) |
| `CONTROL + SHIFT + Escape` | Monitor del sistema (btop) |
| `SUPER + Z` | Ajustes de Noctalia |
| `SUPER + X` | Centro de control |
| `SUPER + Space` | Lanzador de apps |
| `SUPER + period` | Lanzador de emojis |
| `SUPER + L` | Bloquear sesion |
| `SUPER + ALT + C` | Panel de sesion |

### HARDWARE (audio, media, brillo)

| Atajo | Accion |
|---|---|
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Volumen subir/bajar |
| `XF86AudioMute` | Silenciar volumen |
| `XF86AudioMicMute` | Silenciar microfono |
| `XF86AudioPlay` / `XF86AudioPause` | Reproducir/pausar media |
| `XF86AudioNext` / `XF86AudioPrev` | Media siguiente/anterior |
| `XF86MonBrightnessUp` / `XF86MonBrightnessDown` | Brillo subir/bajar |

### UTILIDADES

| Atajo | Accion |
|---|---|
| `SUPER + P` | Seleccionar color (hyprpicker) |
| `Print` | Captura de region (Noctalia) |
| `SUPER + Print` | Captura de pantalla completa (guardar + copiar) |
| `SUPER + SHIFT + T` | Alternar tearing (script) |
| `SUPER + SHIFT + W` | Panel de fondos de pantalla |
| `SUPER + V` | Portapapeles |
| `SUPER + A` | Notificaciones |

### WORKSPACES Y MONITORES

| Atajo | Accion |
|---|---|
| `SUPER + 1..5` | Ir al workspace N |
| `SUPER + CONTROL + 0..9` | Ir al workspace relativo |
| `SUPER + CONTROL + Flechas` | Workspace adyacente / siguiente vacio |
| `SUPER + mouse_up/down` | Cambiar workspace con la rueda |
| `SUPER + SHIFT + S` | Enviar ventana al scratchpad |
| `SUPER + S` | Alternar scratchpad |

## Variables (variables.lua)

| Variable | Valor | Descripcion |
|---|---|---|
| `TERMINAL` | `kitty` | Terminal por defecto |
| `FILE_MANAGER` | `dolphin` | Gestor de archivos |
| `BROWSER` | `firefox` | Navegador web |
| `EDITOR` | `gnome-text-editor --new-window` | Editor de texto (sin atajo asignado) |
| `CALCULATOR` | `gnome-calculator` | Calculadora |
| `MONITOR1` | `HDMI-A-1` | Monitor principal |
| `MONITOR2` / `MONITOR3` | `` | Monitores secundarios |
| `PRIMARY_MONITOR` | `MONITOR1` | Monitor principal (reglas de ventanas) |
| `NUM_WPM` | `5` | Workspaces por monitor (maximo 10) |
