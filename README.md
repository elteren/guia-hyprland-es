# Configuración de Hyprland v0.56.2

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

La config es **lista para usar** y tiene **versiones numeradas** (semver desde la `0`). Cada versión se publica como una **release** de GitHub con su código descargable (zip/tarball) y sus cambios documentados en `CHANGELOG.md`.

- **Descarga la última versión estable**: [página de releases](https://github.com/elteren/guia-hyprland-es/releases) → expande la **Latest** y descarga el **Source code (zip)**.
- O clona el repo: `git clone https://github.com/elteren/guia-hyprland-es.git` (tienes el estado actual en `main`, sin versiones).

Luego **copia los archivos** a tu configuración de Hyprland (`~/.config/hypr/`). La [página 03 de la wiki](https://github.com/elteren/guia-hyprland-es/wiki/03-donde-esta-la-config) te explica **en qué parte va cada archivo**.

Después instala los programas que pide cada archivo (bloque `══ REQUIERE ══`), **copia los scripts** de `scripts/` (ver [Scripts auxiliares](#scripts-auxiliares)) y arranca.

> 📌 Los `.lua` de este repo se actualizan **lo antes posible** cuando una actualización de Hyprland sea importante.
> 🏷️ Las versiones siguen [Versionado Semántico](https://semver.org/lang/es/): cada release (zip) y el `CHANGELOG.md` describen qué cambió.

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

## Scripts auxiliares

El bind que lo necesita usa un script que viene incluido en `scripts/` de este repo. **Cópialo a `~/.local/bin/`** y dale permiso de ejecución:

```bash
mkdir -p ~/.local/bin && cp scripts/*.sh ~/.local/bin/ && chmod +x ~/.local/bin/*.sh
```

| Script | Hotkey | Qué hace |
|---|---|---|
| `tearing-toggle.sh` | `SUPER + SHIFT + T` | Activa/desactiva el tearing (baja latencia en juegos competitivos). |

## Nota: Gaming, Wine/Proton y el anti-freeze

- **Juegos** (Steam `steam_app.*`, `gamescope` y el runtime `steam_proton`) se abren **siempre** en el workspace `gaming` (auto-envío fijo, sin toggle).
- Los juegos se identifican con un **tag dinámico `game`** al crear la ventana (`tag = "+game"` por clase `steam_app.*`/`gamescope`/`steam_proton` o por etiqueta xdg). Matchear el tag (en lugar de `content`) es fiable en reglas estáticas, como recomienda vaxry.
- Al arrancar, la ventana del juego va **borderless flotante a tamaño de monitor** (`float` + `size = "monitor_w monitor_h"`; `min_size`/`max_size` = monitor **bloquean** el redimensionado por el borde) para evitar el **freeze de Proton** en XWayland. Luego, la regla final (por tag, "la última gana") aplica **fullscreen real inmediato** + `immediate` (permite tearing en el juego; el toggle `SUPER + SHIFT + T` sigue siendo el que lo activa).
- Los **emuladores** (Eden) NO reciben el tag `game` a propósito: van al workspace `gaming` sin fullscreen forzado, ya que tienen su propia UI/menús.
- Los juegos **siguen renderizando en segundo plano** aunque su workspace esté oculto (`render_unfocused = true` en borderless y fullscreen + `render_unfocused_fps = 60`).
- **Utilidades de Wine** (launchers, configuradores, prefijos: `wine`, `wine64`, `explorer.exe`, `*.exe`) **ya no van a gaming**: flotan como ventanas limpias (sin bordes, sin blur), sus menús de contexto no roban foco y aparecen **junto al cursor**. Sección `══ WINE / PROTON ══` de `config/windowrules.lua`.
- **Excepción Affinity**: el AppImage de Affinity (`affinity.exe`, empaqueta Wine) se abre **tileado** como app normal (borde estándar); solo su ventana principal. Su **bienvenida** (título vacío) queda **centrada y enfocable**; solo sus menús de contexto (pequeños, título vacío) flotan junto al cursor. En Affinity v3 la ventana secundaria **"Sub"** (superficie de render que se mapea en negro) se oculta en el workspace `special:hidden silent`.
- Excepción: si algún juego lanzado por Steam expone su clase como `<juego>.exe`, flotará como utilidad; agrégala a `gamingApps` para tratarlo como juego.
- **Emuladores** (Eden): se abren siempre en el workspace `gaming` y siguen renderizando en segundo plano aunque el workspace esté oculto (`render_unfocused = true` en la regla de emuladores de `config/windowrules.lua`).

## Requisitos

- **Official**: kitty dolphin firefox gnome-text-editor gnome-calculator
- **AUR**: (ninguno)
- **Custom**: script en `scripts/` del repo → copiar a `~/.local/bin/` (`tearing-toggle.sh`, ver [Scripts auxiliares](#scripts-auxiliares))
- **Extras**: noctalia, uwsm, hyprpicker, grim, wl-clipboard, wl-clip-persist, cliphist

## Atajos de teclado (binds.lua)

Convención: `SUPER` = tecla super (Windows), `CONTROL` = Ctrl, `ALT` = Alt.

### VENTANAS

| Atajo | Acción |
|---|---|
| `SUPER + Escape` | Cerrar ventana (forzado) |
| `SUPER + Q` | Cerrar ventana activa |
| `SUPER + ALT + Space` | Alternar flotante |
| `SUPER + B` | Centrar la ventana flotante enfocada |
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

> 💡 El portapapeles es **persistente**: `wl-clip-persist` (en `config/autostart.lua`) conserva lo copiado aunque cierres la app que lo originó.

### WORKSPACES Y MONITORES

| Atajo | Acción |
|---|---|
| `SUPER + 1..5` | Ir al workspace N |
| `SUPER + CONTROL + 0..9` | Ir al workspace relativo |
| `SUPER + CONTROL + Flechas` | Workspace adyacente / siguiente vacío |
| `SUPER + mouse_up/down` | Cambiar workspace con la rueda |
| `SUPER + CONTROL + mouse_up/down` | Cambiar workspace con la rueda (relativo) |
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
