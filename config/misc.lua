-- Opciones miscelaneas del compositor

hl.config({
    general = {
        layout = "scrolling", -- Layout scrolling (columnas con scroll horizontal)
    },
    scrolling = {
        direction = "right",               -- El contenido crece hacia la derecha
        fullscreen_on_one_column = true,   -- Fullscreen con una sola columna
    },
    misc = {
        col = {
            splash = CACHYLGREEN,          -- Color del splash
        },
        middle_click_paste = false,        -- Desactivar pegar con el boton medio
        enable_swallow = true,             -- Consumir ventanas hijas de la terminal
        swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)", -- Terminales que consumen
        vrr = 3,                           -- VRR (variable refresh rate): on, fullscreen o configurado
    },
    xwayland = {
        force_zero_scaling = true,         -- Sin escalado para apps XWayland
    },
    ecosystem = {
        no_update_news = true,             -- Ocultar noticias de actualizaciones
        no_donation_nag = true,            -- Ocultar avisos de donaciones
    },
})
