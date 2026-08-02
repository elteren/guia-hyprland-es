-- Variables de entorno (referencia: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/)
-- Si usas UWSM, define las variables en ~/.config/uwsm/env
-- Si no usas UWSM, definelas aqui (ej. hl.env("QT_QPA_PLATFORM", "wayland"))

-- Si tienes una GPU NVIDIA, descomenta las siguientes lineas:

-- hl.env("GBM_BACKEND", "nvidia-drm") -- Forzar GBM como backend
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- Forzar GBM como backend
-- hl.env("LIBVA_DRIVER_NAME", "nvidia") -- Aceleracion por hardware en GPUs NVIDIA
-- hl.env("__GL_GSYNC_ALLOWED", "1") -- Permite G-Sync (VRR) en monitores compatibles
