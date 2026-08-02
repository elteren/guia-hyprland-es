-- Configuracion de entrada (raton, teclado y gestos)

hl.config({
    input = {
        -- sensitivity = -0.25,
        accel_profile = "flat",  -- Aceleracion del mouse desactivada
        kb_layout = "latam",     -- Teclado latinoamericano
    },
    -- Descomenta para usar cursores por software (ayuda con problemas de display)
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

-- Gestos del touchpad (sin efecto: no hay touchpad, solo mouse)
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })  -- 4 dedos horizontal: cambiar workspace
hl.gesture({ fingers = 3, direction = "down",       action = "close" })      -- 3 dedos abajo: cerrar ventana
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" }) -- 3 dedos arriba: pantalla completa
hl.gesture({ fingers = 3, direction = "left",       action = "float" })      -- 3 dedos izquierda: flotante
