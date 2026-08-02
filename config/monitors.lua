-- Regla del monitor. Wiki: https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Las salidas se listan con "hyprctl monitors". Las salidas se configuran en variables.lua, no aqui.
-- Ejemplo comentado:
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

-- Monitor principal: modo preferido y posicion/escale automaticos
hl.monitor({
    output    = MONITOR1,
    mode      = "preferred",
    position  = "auto",
    scale     = "auto",
})
