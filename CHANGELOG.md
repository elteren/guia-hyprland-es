# Registro de cambios

Todas las versiones de la configuración se numeran con [Versionado Semántico](https://semver.org/lang/es/) desde la `0`. Cada release publicada en GitHub incluye el código fuente descargable (zip/tarball).

## [v0.2.6] - 2026-08-20

- Gaming: migración a **tags dinámicos** (`tag = "+game"` por clase `steam_app.*`/`gamescope`/`steam_proton` o por etiqueta xdg) en lugar de matchear `content` en reglas estáticas (no fiable, vaxry oct/2025). Matchear `tag = "game"` casa con `game*`.
- Gaming: fullscreen real **inmediato** por tag (la última regla gana), con las mismas condiciones anti-freeze de la borderless.
- Gaming: `min_size`/`max_size` = monitor **bloquean el redimensionado** de la ventana flotante por el borde (`resize_on_border = true`); aplica también a la regla de `steam_app` sin título.
- Emuladores (Eden): **sin** tag `game` a propósito, para que la regla de fullscreen no les fuerce pantalla completa (tienen UI/menús propia).
- Fix: hotkey `SUPER + D` usa `mode = "maximized"` (sintaxis oficial Lua; `mode = 1` era la heredada de hyprlang).
- Cabecera de `hyprland.lua`: versión v0.56.2.

## [v0.2.5] - 2026-08-19

- Emuladores: Eden se abre siempre en el workspace `gaming` y sigue renderizando en segundo plano cuando el workspace está oculto (`render_unfocused = true` en la regla de emuladores de `config/windowrules.lua`).

## [v0.2.4-1] - 2026-08-16

- Fix: hotkey `SUPER + B` centra la ventana flotante enfocada (`hl.dsp.window.center()`).

## [v0.2.4] - 2026-08-15

- Juegos: siguen renderizando en segundo plano cuando su workspace está oculto (`render_unfocused = true` en las reglas borderless y fullscreen real) con `render_unfocused_fps = 60` (limite de FPS en segundo plano, default 15).
- Juegos: el estado de arranque (borderless) ahora es **flotante** (`float = true`, borderless windowed real), como recomienda la comunidad; al confirmarse el contenido `"game"` sigue aplicando fullscreen real.
- Affinity v3: la ventana secundaria "Sub" (superficie de render que Wine/XWayland mapea en negro) se oculta en el workspace `special:hidden silent` sin foco inicial.

## [v0.2.3] - 2026-08-12

- Validada en **Hyprland v0.56.2**.
- Apps del Hub (Vesktop, ZapZap, Steam, Lutris, Heroic, Bottles): se abren **a todo el ancho** en el workspace 3 con `scrolling_width = 1.0` (el "maximizar" del layout scrolling; aplica con `hyprctl reload`, sin handlers).
- OBS: además de ir al workspace `5 silent`, abre **a todo el ancho y sin robar el foco** (`no_initial_focus` + `suppress_event = "activate"`).
- Restaurada la regla global `suppress-maximize-events` a `enabled = true`.
- Decorations: esquinas redondeadas (`rounding` de 0 a 12); gaps `in` = 1 y `out` = 2.

## [v0.2.2] - 2026-08-10

- Reglas de ventana para otros launchers de juegos: Lutris, Heroic y Bottles se abren tiled en el workspace `3 silent` (sin foco inicial ni notificaciones), igual que Steam.
- Fix: clase real de Heroic (`heroic`, en minusculas) y APP_ID real de Bottles (`com.usebottles.bottles`) para que las reglas apliquen.

## [v0.2.1] - 2026-08-06

- Validada en **Hyprland v0.56.2** (versión de solo fixes: sin cambios de API Lua, sin cambios de config).
- Fix: la regla de tearing usa el campo `immediate` en lugar de `tearing`.
- Affinity (AppImage con Wine): se abre tileada como app normal; solo sus menús flotan.
- Fix: bienvenida de Affinity centrada y enfocable; menús de Wine solo si son pequeños.
- Comentarios uniformizados (encabezado + `══ REQUIERE ══` + secciones) en `decorations.lua`, `misc.lua` y `animations.lua`.
- README: versión v0.56.2, portapapeles persistente (`wl-clip-persist`) y hotkey `SUPER+CONTROL+mouse` para cambiar workspace con la rueda.

## [v0.2.0] - 2026-08-06

- Gaming: auto-envío fijo de juegos al workspace `gaming` (sin toggle).
- Anti-freeze de Proton: juegos abren borderless a tamaño de monitor; fullscreen real solo cuando se confirma el contenido `"game"`.
- Utilidades de Wine/Proton (launchers, configuradores, prefijos): flotantes, sin bordes ni blur, menús junto al cursor.
- Script `scripts/tearing-toggle.sh` (hotkey `SUPER+SHIFT+T`) para alternar el tearing.

## [v0.1.0] - 2026-08-02

- Configuración inicial para **Hyprland v0.56.1** con sintaxis Lua.
- Módulos por tema cargados por `hyprland.lua`, workspace gaming y streaming, README del proyecto.
