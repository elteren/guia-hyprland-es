-- Reglas de ventanas. Wiki: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- IMPORTANTE: las reglas se evaluan de arriba hacia abajo y las ultimas ganan,
-- por eso este archivo NO se reordena; solo se agrupa visualmente.
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): steam gamescope wine discord ark dolphin mpv haruna gwenview vlc
--                    pavucontrol blueman network-manager-applet winetricks protontricks
--                    xdg-desktop-portal-gtk obs-studio easyeffects kvantum qt5ct qt6ct
--                    nwg-look firefox
-- AUR: vesktop-bin zapzap satty zen-browser pipeweaver pipeweaver-app
-- Custom (no es paquete): firebot, plex

-- ══ REGLAS GENERALES ══

-- Posicionar al centro las ventanas ya flotantes y recordar su tamano
hl.window_rule({ match = { float = true }, center = true, persistent_size = true })

-- ══ PICTURE-IN-PICTURE ══

-- PiP: flotar, fijar y escalar al 25% del monitor
hl.window_rule({
    match             = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float             = true,
    keep_aspect_ratio = true,
    size              = { "max(monitor_w, monitor_h)*0.25", "min(monitor_w, monitor_h)*0.25" },
    pin               = true,
})

-- ══ GAMING ══

-- Apps de juego (steam, gamescope y ejecutables .exe de Wine)
local gamingApps = "^(steam_app.*|gamescope|.*\\.exe)$" -- Requiere: steam, gamescope, wine (para .exe)
-- Workspace dedicado a juegos
local gamingWorkspace = "name:gaming"

-- Auto-envio de juegos al workspace gaming: se activa/desactiva con el hotkey
-- SUPER+G (script ~/.local/bin/gaming-toggle.sh). Estado: ~/.local/state/hypr/gaming-automove
local gamingAutomoveFile = os.getenv("HOME") .. "/.local/state/hypr/gaming-automove"
local gamingAutomoveOn   = true
local stateF = io.open(gamingAutomoveFile, "r")
if stateF then
    gamingAutomoveOn = (stateF:read("*l") or "1") == "1"
    stateF:close()
end

if gamingAutomoveOn then
    -- Contenido "game" va al workspace gaming
    hl.window_rule({ match = { content = "game" }, workspace = gamingWorkspace })
    -- Etiqueta xdg "game" va al workspace gaming en pantalla completa
    hl.window_rule({ match = { xdg_tag = "^(.*game.*)$" }, workspace = gamingWorkspace, fullscreen_state = "2", content = "game" })
    -- Cualquier app de la lista gamingApps va al workspace gaming
    hl.window_rule({ match = { class = gamingApps }, workspace = gamingWorkspace })
end
-- Steam: lista de amigos flotante
hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true }) -- Requiere: steam
if gamingAutomoveOn then
    -- Steam: ventana de "Lanzando..." flotante y centrada
    hl.window_rule({ match = { class = "^(steam)$", title = "^(Launching\\.{3})$" }, float = true, center = true, workspace = gamingWorkspace }) -- Requiere: steam
    -- Juegos (menos los que se abren desde /home): inmersivo fullscreen
    hl.window_rule({
        match = {
            class         = gamingApps,
            title         = "^(.+)$",
            initial_title = "negative:^(.*/home/.*)$",
        },
        content          = "game",
        decorate         = false,
        fullscreen_state = "2",
        size             = { "monitor_w", "monitor_h" },
        immediate        = true,
    })
    -- Steam app sin titulo inicial: centrada, flotante y sin fullscreen
    hl.window_rule({
        match = {
            class         = "^(steam_app.*)$",
            initial_title = "^$",
        },
        center           = true,
        float            = true,
        fullscreen       = false,
        fullscreen_state = "0",
        workspace        = gamingWorkspace,
    }) -- Requiere: steam
end

-- ══ APPS ══

-- hl.window_rule({ match = { class = "^(.*\\.exe)$", float = true }, center = true }) -- Desactivada: redundante con gamingApps (linea 16 incluye ".*\\.exe"; lineas 21/24-35 la mandan a gaming fullscreen, nunca flota). Rehabilitar solo para .exe de Wine fuera del gaming.
-- Lanzadores flotantes en el monitor principal
hl.window_rule({ match = { class = "^(.*[Ll]auncher.*)$" }, float = true, monitor = PRIMARY_MONITOR })
-- Discord en el monitor principal
hl.window_rule({ match = { class = "^(discord)$" }, monitor = PRIMARY_MONITOR }) -- Requiere: discord
-- Vesktop (Discord) en workspace 3 silencioso
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "3 silent", no_initial_focus = true, suppress_event = "activate" }) -- Requiere: vesktop-bin (AUR)
-- ZapZap (WhatsApp) en workspace 3 silencioso
hl.window_rule({ match = { class = "^(com\\.rtosta\\.zapzap)$" }, workspace = "3 silent", no_initial_focus = true, suppress_event = "activate" }) -- Requiere: zapzap (AUR)
-- Calculadoras flotantes a tamano fijo
hl.window_rule({ match = { class = "^(.*[Cc]alc.*)$" }, float = true, size = { "max(monitor_w, monitor_h)*0.17", "min(monitor_w, monitor_h)*0.43" } }) -- Requiere: gnome-calculator
-- Selector de tipo de archivo de KDE flotante
hl.window_rule({ match = { class = "^(org\\.kde\\.keditfiletype)$" }, float = true }) -- Requiere: kdeutils (keditfiletype)
-- Ark (gestor de archivos KDE) a tamano fijo
hl.window_rule({ match = { class = "^(org\\.kde\\.ark)$" }, size = { "max(monitor_w, monitor_h)*0.40", "min(monitor_w, monitor_h)*0.40" } }) -- Requiere: ark
-- Satty (captura anotada) flotante a tamano minimo
hl.window_rule({ match = { class = "^(.*satty.*)$", title = "^(Satty)$" }, min_size = { "max(monitor_w, monitor_h)*0.35", "min(monitor_w, monitor_h)*0.35" }, float = true }) -- Requiere: satty (AUR)
-- Noctalia (ajustes) flotante al 70% del monitor
hl.window_rule({ match = { class = "^(dev\\.)?(noctalia\\.Noctalia(\\.Settings)?)$" }, float = true, size = { "monitor_w*0.70", "monitor_h*0.70" } }) -- Requiere: noctalia
-- Dolphin: dialogo de operaciones flotante y centrado donde este el cursor
hl.window_rule({
    match = {
        class = "^(org\\.kde\\.dolphin)$",
        title = "negative:^(Moving.*|Create New.*|Extract.*|Compress.*|Copying.*|Progress.*|Configure.*|Properties.*|Choose\\sApplication.*)$",
    },
    float = true,
    size = { "max(monitor_w, monitor_h)*0.50", "min(monitor_w, monitor_h)*0.55" },
    move = {
        "max(20, min(cursor_x - (window_w*0.50), monitor_w - window_w + 20))", -- Clampear en X
        "max(20, min(cursor_y - 50, monitor_h - window_h + 20))" -- Clampear en Y
    },
}) -- Requiere: dolphin

-- ══ OPACIDAD ══

-- Terminales: dejar que la app gestione su propia transparencia
local terminals = "^(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)$" -- Requiere: kitty, ghostty, konsole, alacritty, gnome-terminal o xfce4-terminal

-- Navegadores: opacidad completa
hl.window_rule({ match = { class = "^(firefox|zen)$" }, opacity = "1.0 override" }) -- Requiere: firefox o zen-browser (AUR)
-- Terminales: opacidad completa (quitar si la terminal no soporta transparencia)
hl.window_rule({ match = { class = terminals }, opacity = "1.0 override" })
-- Reproductores y visores: opacidad completa
hl.window_rule({ match = { class = "^(mpv|org.kde.haruna|.*plex.*|org\\.kde\\.gwenview|.*vlc.*)$" }, opacity = "1.0 override" }) -- Requiere: mpv, haruna, plex (custom), gwenview o vlc

-- ══ FLOTANTES Y MODALES ══

-- Ventanas de utilidades flotantes
local floatApps = {
    { class = "^(kvantummanager|qt[56]ct|nwg-look)$" }, -- Requiere: kvantum, qt5ct/qt6ct, nwg-look
    { class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" }, -- Requiere: pavucontrol, blueman, network-manager-applet
    { title = "^(Winetricks.*|Protontricks.*)$" }, -- Requiere: winetricks, protontricks
}
for _, m in ipairs(floatApps) do hl.window_rule({ match = m, float = true }) end

-- Modales comunes flotantes
local modalMatches = {
    { title = "^(Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress)$" },
    { initial_title = "^(Open File)$" },
    { class = "^([Xx]dg-desktop-portal-gtk)$" }, -- Requiere: xdg-desktop-portal-gtk
    { title = "^(File Upload|Choose wallpaper|Library)(.*)$" },
    { class = "^(.*dialog.*)$" },
    { title = "^(.*dialog.*)$" },
    { class = "^(hyprland-share-picker)$"}, -- Requiere: hyprland-share-picker
}
for _, m in ipairs(modalMatches) do hl.window_rule({ match = m, float = true }) end

-- ══ REGLAS GLOBALES ══

-- Ignorar las peticiones de maximizar de todas las apps (suele gustar)
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Arreglar problemas de arrastre con XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- ══ STREAMING ══

-- Firefox: navegador principal en workspace 2
hl.window_rule({ match = { class = "^(firefox)$" }, workspace = "2" }) -- Requiere: firefox

-- Steam: ventana principal en workspace 3, en mosaico y silenciosa
hl.window_rule({
    match = { class = "^(steam)$", title = "^(Steam)$" },
    workspace        = "3 silent",
    no_initial_focus = true,
    suppress_event   = "activate",
    tile             = true,
}) -- Requiere: steam
-- Steam: cualquier otra ventana flotante y centrada
hl.window_rule({
    match = { class = "^(steam)$", title = "negative:^(Steam)$" },
    float  = true,
    center = true,
}) -- Requiere: steam

-- OBS: workspace 5 silencioso
hl.window_rule({ match = { class = "^(com\\.obsproject\\.Studio)$" }, workspace = "5 silent" }) -- Requiere: obs-studio
-- PipeWeaver: workspace 5 silencioso
hl.window_rule({ match = { class = "^(pipeweaver-app)$" }, workspace = "5 silent" }) -- Requiere: pipeweaver, pipeweaver-app (AUR)
-- Firebot: workspace 5 silencioso
hl.window_rule({ match = { class = "^(firebotv5)$" }, workspace = "5 silent", no_initial_focus = true, suppress_event = "activate" }) -- Requiere: firebot (custom)
-- EasyEffects: workspace 5 silencioso
hl.window_rule({ match = { initial_class = "^com\\.github\\.wwmm\\.easyeffects$" }, workspace = "5 silent", no_initial_focus = true, suppress_event = "activate" }) -- Requiere: easyeffects
