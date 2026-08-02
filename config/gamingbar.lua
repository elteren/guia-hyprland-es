-- Ocultar la barra de Noctalia solo en el workspace gaming mientras tenga ventanas.
-- En el resto de los workspaces la barra queda visible.
--
-- ══ REQUIERE ══
-- pacman (oficial): noctalia

local GAMING_WS_NAME = "gaming" -- Nombre del workspace gaming
local GAMING_WS_ID = 4           -- ID del workspace gaming

local bar_hidden = false -- Estado actual de la barra

-- Sincronizar la barra segun el workspace activo y sus ventanas
local function sync_bar()
    local ws = hl.get_active_workspace()
    local hide = false
    if ws ~= nil and (ws.name == GAMING_WS_NAME or ws.id == GAMING_WS_ID) then
        local wins = hl.get_workspace_windows(ws.id)
        hide = wins ~= nil and #wins > 0 -- Ocultar solo si hay ventanas
    end
    if hide and not bar_hidden then
        hl.exec_cmd("noctalia msg bar-hide") -- Ocultar la barra -- Requiere: noctalia
        bar_hidden = true
    elseif not hide and bar_hidden then
        hl.exec_cmd("noctalia msg bar-show") -- Mostrar la barra -- Requiere: noctalia
        bar_hidden = false
    end
end

hl.on("hyprland.start", sync_bar)            -- Al iniciar Hyprland
hl.on("workspace.active", sync_bar)          -- Al cambiar de workspace
hl.on("window.open", sync_bar)               -- Al abrir una ventana
hl.on("window.close", sync_bar)              -- Al cerrar una ventana
hl.on("window.destroy", sync_bar)            -- Al destruir una ventana
hl.on("window.move_to_workspace", sync_bar)  -- Al mover una ventana a otro workspace
