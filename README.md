# Configuración de Hyprland v0.56.1

Una configuración de Hyprland para CachyOS, hecha con UWSM y Lua.

## ¿Para qué es este repo?

Este repositorio contiene dos cosas a la vez:

1. **Los archivos `.lua` de configuración**, listos para usar (gaming y streaming).
2. La [wiki de este proyecto](https://github.com/elteren/guia-hyprland-es/wiki), una **guía en español** para que entiendas esos archivos paso a paso. Está pensada para novatos: explica la sintaxis de Hyprland v0.56+ desde cero.

La wiki siempre indica la versión de Hyprland a la que pertenece.

## Aviso

> ⚠️ Esta configuración se desarrolló y probó en **CachyOS**. Los archivos `.lua` de este repositorio pueden no funcionar igual en otras distribuciones, y **no nos hacemos responsables** de su uso fuera de CachyOS. Aun así, la **wiki** te sirve para **aprender** Hyprland en cualquier distribución.

## Créditos

La configuración base de los archivos `.lua` parte de la plantilla de **CachyOS** y de la documentación de **Hyprland**; algunas partes se mantienen tal cual.

- [Hyprland](https://hyprland.org) — compositor Wayland (documentación: [wiki.hypr.land](https://wiki.hypr.land))
- [CachyOS](https://cachyos.org) — distribución Arch optimizada

## Mantenimiento

- **Autor único.** Esta guía y la configuración del repositorio las mantiene **una sola persona** en su tiempo libre. Se actualizan cuando una versión de Hyprland lo requiere o cuando se detectan errores.
- **Hecho con IA y verificado.** La wiki se redactó con ayuda de **inteligencia artificial**, siempre a partir de la documentación oficial. Actualmente se está realizando una **verificación manual** para corregir los fallos: la mayoría de las páginas ya están correctas y el resto se está puliendo.
- **¿Quieres contribuir?** Cualquier persona es libre de **solicitar mejoras o actualizaciones** abriendo una *issue* o una *pull request* en el repositorio.

## Cómo usar esta configuración

Es **lista para usar**: descarga los archivos (botón **Code → Download ZIP** o `git clone https://github.com/elteren/guia-hyprland-es.git`) y **cópialos en tu configuración de Hyprland** (`~/.config/hypr/`). La [página 03 de la wiki](https://github.com/elteren/guia-hyprland-es/wiki/03-donde-esta-la-config) te explica **en qué parte va cada archivo**.

Después instala los programas que pide cada archivo (bloque `══ REQUIERE ══`) y arranca.

> 📌 Los `.lua` de este repo se actualizan **lo antes posible** cuando una actualización de Hyprland sea importante.

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

## Nota: Wine/Proton y el workspace gaming

En `config/windowrules.lua`, la lista `gamingApps` incluye `.*\.exe` (línea 32). Por eso **cualquier programa ejecutado con Wine/Proton (los `.exe`) se abre automáticamente en el workspace `gaming`** (regla de la línea 41) **forzado a pantalla completa** (regla "inmersiva", líneas 47–58).

Esto puede **causar ciertos problemas**: apps de Windows que no son juegos abren a fullscreen en el workspace gaming, a veces mal posicionadas o con el foco raro, o conflictos con la interfaz de Proton/Wine.

**Se puede desactivar** de estas formas:

1. Quitar `.*\.exe` de la regex (línea 32):
   ```lua
   local gamingApps = "^(steam_app.*|gamescope)$"
   ```
2. Comentar la regla de fullscreen "inmersivo" (líneas 47–58) si quieres que sigan yendo al workspace `gaming` pero **sin** forzar fullscreen.
3. Comentar también la regla de la línea 41 si no quieres que vayan al workspace `gaming`.

## Requisitos

- **Official**: kitty dolphin firefox gnome-text-editor gnome-calculator
- **AUR**: (ninguno)
- **Custom**: script propio `~/.local/bin/tearing-toggle.sh`
- **Extras**: noctalia, uwsm, hyprpicker, grim, wl-clipboard, cliphist

## Atajos de teclado (binds.lua)

Convención: `SUPER` = tecla super (Windows), `CONTROL` = Ctrl, `ALT` = Alt.

### VENTANAS

| Atajo | Acción |
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
| `SUPER + SHIFT + Flechas` | Mover ventana en dirección |
| `SUPER + SHIFT + 1..5` | Mover ventana a un workspace |
| `SUPER + SHIFT + mouse_up/down` | Mover ventana a otro monitor |
| `SUPER + CONTROL + SHIFT + Flechas / mouse` | Mover ventana al workspace adyacente |
| `SUPER + SHIFT + CONTROL + 0..9` | Mover ventana al workspace relativo |
| `SUPER + mouse:272` / `SUPER + mouse:273` | Arrastrar / redimensionar con el mouse |

### APPS

| Atajo | Acción |
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
| `SUPER + L` | Bloquear sesión |
| `SUPER + ALT + C` | Panel de sesión |

### HARDWARE (audio, media, brillo)

| Atajo | Acción |
|---|---|
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Volumen subir/bajar |
| `XF86AudioMute` | Silenciar volumen |
| `XF86AudioMicMute` | Silenciar micrófono |
| `XF86AudioPlay` / `XF86AudioPause` | Reproducir/pausar media |
| `XF86AudioNext` / `XF86AudioPrev` | Media siguiente/anterior |
| `XF86MonBrightnessUp` / `XF86MonBrightnessDown` | Brillo subir/bajar |

### UTILIDADES

| Atajo | Acción |
|---|---|
| `SUPER + P` | Seleccionar color (hyprpicker) |
| `Print` | Captura de región (Noctalia) |
| `SUPER + Print` | Captura de pantalla completa (guardar + copiar) |
| `SUPER + SHIFT + T` | Alternar tearing (script) |
| `SUPER + SHIFT + W` | Panel de fondos de pantalla |
| `SUPER + V` | Portapapeles |
| `SUPER + A` | Notificaciones |

### WORKSPACES Y MONITORES

| Atajo | Acción |
|---|---|
| `SUPER + 1..5` | Ir al workspace N |
| `SUPER + CONTROL + 0..9` | Ir al workspace relativo |
| `SUPER + CONTROL + Flechas` | Workspace adyacente / siguiente vacío |
| `SUPER + mouse_up/down` | Cambiar workspace con la rueda |
| `SUPER + SHIFT + S` | Enviar ventana al scratchpad |
| `SUPER + S` | Alternar scratchpad |

## Variables (variables.lua)

| Variable | Valor | Descripción |
|---|---|---|
| `TERMINAL` | `kitty` | Terminal por defecto |
| `FILE_MANAGER` | `dolphin` | Gestor de archivos |
| `BROWSER` | `firefox` | Navegador web |
| `EDITOR` | `gnome-text-editor --new-window` | Editor de texto (sin atajo asignado) |
| `CALCULATOR` | `gnome-calculator` | Calculadora |
| `MONITOR1` | `HDMI-A-1` | Monitor principal |
| `MONITOR2` / `MONITOR3` | `` | Monitores secundarios |
| `PRIMARY_MONITOR` | `MONITOR1` | Monitor principal (reglas de ventanas) |
| `NUM_WPM` | `5` | Workspaces por monitor (máximo 10) |
