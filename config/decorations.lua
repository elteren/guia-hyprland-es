-- Configuracion visual: gaps, bordes, grupos, opacidad y sombras.
-- Los colores se definen en colors.lua (paleta Cachy), no aqui.
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): (ninguno) -- Solo usa colores de colors.lua, sin paquetes propios

hl.config({
    -- ══ GENERAL (gaps y bordes) ══

    general = {
        gaps_in = 1,               -- Espacio entre ventanas (separación entre programas)
        gaps_out = 2,              -- Separación uniforme en las 4 aristas del monitor
        border_size = 2,           -- Grosor del borde
        extend_border_grab_area = 10, -- Area extra para redimensionar desde el borde
        resize_on_border = true,   -- Redimensionar con el borde
        col = {
            active_border = {
                colors = { CACHYLGREEN, CACHYDGREEN }, -- Borde activo en degradado verde
                angle = 45,
            },
            inactive_border = CACHYGRAY, -- Borde inactivo gris
        },
    },

    -- ══ GRUPOS (bordes y barra de grupo) ══

    group = {
        col = {
            border_active = CACHYLBLUE,          -- Borde del grupo activo
            border_inactive = CACHYGRAY,         -- Borde del grupo inactivo
            border_locked_active = CACHYDBLUE,   -- Borde del grupo activo bloqueado
            border_locked_inactive = CACHYGRAY,  -- Borde del grupo inactivo bloqueado
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,            -- Barra del grupo activo
                inactive = CACHYGRAY,            -- Barra del grupo inactivo
                locked_active = CACHYDBLUE,      -- Barra del grupo activo bloqueado
                locked_inactive = CACHYGRAY,     -- Barra del grupo inactivo bloqueado
            },
        },
    },

    -- ══ DECORATION (opacidad, blur y sombras) ══

    decoration = {
        dim_special = 0.0,          -- Sin atenuar el scratchpad
        rounding = 12,              -- Esquinas redondeadas
        active_opacity = 1.0,       -- Opacidad de la ventana activa
        inactive_opacity = 1.0,     -- Opacidad de la ventana inactiva
        fullscreen_opacity = 1,     -- Opacidad en pantalla completa
        blur = {
            enabled = false,        -- Sin desenfoque
        },
        shadow = {
            enabled = false,        -- Sin sombras
        },
    },
})
