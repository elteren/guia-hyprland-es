# Configuracion Hyprland v0.56.1

Configuracion de Hyprland para CachyOS usando UWSM y Lua.

## ¿Para qué es esta wiki?

La [wiki de este proyecto](https://github.com/elteren/guia-hyprland-es/wiki) es una **guía en español** para entender los **archivos `.lua`** de esta configuración. Está pensada para novatos y explica la sintaxis de Hyprland v0.56+ paso a paso (la wiki siempre indica la versión de Hyprland a la que pertenece).

- Los `.lua` de este repo se actualizan **lo antes posible** cuando una actualización de Hyprland sea importante.
- Esta config está **optimizada para gaming y streaming** y es **lista para usar**: clona el repo, instala los programas de cada archivo (bloque `══ REQUIERE ══`) y arranca.

## Archivos de configuración (listos para usar)

La config está dividida en módulos (un archivo por tema). `hyprland.lua` los carga en orden. **Léelos** para ver qué secciones te sirven y qué programas necesitas instalar.

| Archivo | Para qué es |
|---|---|
| `hyprland.lua` | Entrada principal: carga los módulos en orden de dependencias |
| `config/variables.lua` | Apps por defecto (`TERMINAL`, `BROWSER`…), monitores, workspaces |
| `config/colors.lua` | Paleta de colores Cachy |
| `config/environment.lua` | Variables de entorno (UWSM) |
| `config/inputs.lua` | Ratón, teclado y gestos |
| `config/animations.lua` | Curvas y animaciones |
| `config/decorations.lua` | Gaps, bordes, grupos, opacidad |
| `config/misc.lua` | Opciones misceláneas (layout scrolling) |
| `config/monitors.lua` | Reglas de monitores |
| `config/autostart.lua` | Programas al iniciar sesión |
| `config/binds.lua` | Atajos de teclado y mouse |
| `config/windowrules.lua` | Reglas de ventanas (gaming y streaming) |
| `config/workspaces.lua` | Workspaces persistentes: Main, Web, Hub, gaming, Live |
| `config/gamingbar.lua` | Oculta la barra de Noctalia en el workspace gaming |

Cada archivo trae en su cabecera un bloque **`══ REQUIERE ══`** con los programas exactos que hace falta instalar para usarlo.

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
