-- Apps por defecto de Hyprland
--
-- ══ REQUIERE (instalar antes de usar este archivo) ══
-- pacman (oficial): kitty dolphin firefox gnome-text-editor gnome-calculator

-- Terminal
TERMINAL     = "kitty" -- Requiere: kitty
-- Gestor de archivos
FILE_MANAGER = "dolphin" -- Requiere: dolphin
-- Navegador web
BROWSER      = "firefox" -- Requiere: firefox
-- Editor de texto
EDITOR       = "gnome-text-editor --new-window" -- Requiere: gnome-text-editor
-- Calculadora
CALCULATOR   = "gnome-calculator" -- Requiere: gnome-calculator

-- Monitores (salidas de hyprctl monitors)
MONITOR1 = "HDMI-A-1"
MONITOR2 = ""
MONITOR3 = ""
-- Monitor principal (usado por las reglas de ventanas)
PRIMARY_MONITOR = MONITOR1

-- Workspaces por monitor (maximo 10)
NUM_WPM = 5
