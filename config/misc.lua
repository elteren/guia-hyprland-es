-- Opciones miscelaneas del compositor: layout, scrolling, VRR y consumir ventanas.
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): (ninguno) -- Opciones del compositor, sin paquetes propios

hl.config({
    -- Layout por defecto: scrolling (columnas con scroll horizontal)
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
        -- VRR (variable refresh rate). 3 = activo: fullscreen y normal. Nota: si el monitor no
        -- reporta adaptive sync por esa conexion, el log mostrara "No Adaptive sync support" (aviso, no error).
        vrr = 3,
        -- Max FPS de render en segundo plano para ventanas con render_unfocused (default 15)
        render_unfocused_fps = 60,
    },
    xwayland = {
        force_zero_scaling = true,         -- Sin escalado para apps XWayland
    },
    ecosystem = {
        no_update_news = true,             -- Ocultar noticias de actualizaciones
        no_donation_nag = true,            -- Ocultar avisos de donaciones
    },
})
