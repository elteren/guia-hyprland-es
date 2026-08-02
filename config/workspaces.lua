-- Workspaces persistentes. Wiki: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Workspaces nombrados para gaming y streaming
hl.workspace_rule({ workspace = "1", default_name = "Main",   persistent = true, default = true }) -- Principal (por defecto)
hl.workspace_rule({ workspace = "2", default_name = "Web",    persistent = true }) -- Navegador
hl.workspace_rule({ workspace = "3", default_name = "Hub",    persistent = true }) -- Discord/WhatsApp
hl.workspace_rule({ workspace = "4", default_name = "gaming", persistent = true }) -- Juegos
hl.workspace_rule({ workspace = "5", default_name = "Live",   persistent = true }) -- Streaming (OBS, PipeWeaver, Firebot)
