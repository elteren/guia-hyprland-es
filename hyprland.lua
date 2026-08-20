-- Hyprland v0.56.2 (CachyOS) - configuracion Lua
-- Los modulos se cargan en orden de dependencias (variables y colores primero).

require("config.variables")     -- Apps por defecto, monitores, workspaces
require("config.colors")        -- Paleta de colores Cachy
require("config.environment")   -- Variables de entorno (UWSM)
require("config.inputs")        -- Raton, teclado y gestos
require("config.animations")    -- Curvas y animaciones
require("config.decorations")   -- Gaps, bordes, grupos, opacidad
require("config.misc")          -- Layout scrolling y opciones varias
require("config.monitors")      -- Regla del monitor
require("config.workspaces")    -- Workspaces persistentes
require("config.binds")         -- Atajos de teclado y mouse
require("config.windowrules")   -- Reglas de ventanas
require("config.autostart")     -- Programas al iniciar sesion
require("config.gamingbar")     -- Ocultar barra en el workspace gaming
