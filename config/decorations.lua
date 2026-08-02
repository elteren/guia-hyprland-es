-- Configuracion visual (gaps, bordes, grupos, opacidad)

hl.config({
    general = {
        gaps_in = 0,               -- Espacio entre ventanas
        gaps_out = 0,              -- Espacio en los bordes del monitor
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
    decoration = {
        dim_special = 0.0,          -- Sin atenuar el scratchpad
        rounding = 0,               -- Sin esquinas redondeadas
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
