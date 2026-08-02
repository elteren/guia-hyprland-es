-- Curvas y animaciones por defecto, ver https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Curvas bezier
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } }) -- Desaceleracion suave
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } }) -- Aceleracion simetrica
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } }) -- Sin aceleracion
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } }) -- Casi lineal
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } }) -- Rapida
hl.curve("overshoot",      { type = "bezier", points = { {0.5, 0.9}, {0.1, 1.1}     } }) -- Con rebote

-- Curvas tipo resorte
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 500, dampening = 35 }) -- Resorte suave
hl.curve("rubber",         { type = "spring", mass = 1, stiffness = 200,  dampening = 15 }) -- Resorte elastico

-- Animaciones
hl.animation({ leaf = "global",              enabled = true, speed = 4, bezier = "quick"                 }) -- Global
hl.animation({ leaf = "windows",             enabled = true, speed = 4, spring = "easy",  style = "slide" }) -- Ventanas
hl.animation({ leaf = "workspaces",          enabled = true, speed = 2, bezier = "quick", style = "slide" }) -- Workspaces
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 3, bezier = "quick", style = "slide top"}) -- Scratchpad al entrar
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 3, bezier = "quick", style = "slide bottom"}) -- Scratchpad al salir
