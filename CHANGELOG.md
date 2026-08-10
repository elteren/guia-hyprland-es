# Registro de cambios

Todas las versiones de la configuración se numeran con [Versionado Semántico](https://semver.org/lang/es/) desde la `0`. Cada release publicada en GitHub incluye el código fuente descargable (zip/tarball).

## [v0.2.1-1] - 2026-08-10

- Reglas de ventana para otros launchers de juegos: Lutris, Heroic y Bottles se abren tiled en el workspace `3 silent` (sin foco inicial ni notificaciones), igual que Steam.

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
