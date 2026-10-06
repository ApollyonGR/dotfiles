hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })
hl.curve("overshot",       { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("smoothIn",       { type = "bezier", points = { {0.25, 1}, {0.5, 1} } })
hl.curve("smoothOut",      { type = "bezier", points = { {0.36, 0}, {0.66, -0.56} } })
hl.curve("linear",         { type = "bezier", points = { {0.5, 0.5}, {0.5, 0.5} } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

-- Default springs
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.5,  bezier = "almostLinear", style = "fade" })
--hl.animation({ leaf = "workspaces",    enabled = true,  speed = 40,  bezier = "linear", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more

-- global
--   ↳ windows - styles: slide, popin, gnomed
--     ↳ windowsIn - window open - styles: same as windows
--     ↳ windowsOut - window close - styles: same as windows
--     ↳ windowsMove - everything in between, moving, dragging, resizing.
--   ↳ layers - styles: slide, popin, fade
--     ↳ layersIn - layer open
--     ↳ layersOut - layer close
--   ↳ fade
--     ↳ fadeIn - fade in for window open
--     ↳ fadeOut - fade out for window close
--     ↳ fadeSwitch - fade on changing activewindow and its opacity
--     ↳ fadeShadow - fade on changing activewindow for shadows
--     ↳ fadeGlow - fade on changing activewindow for glow
--     ↳ fadeDim - the easing of the dimming of inactive windows
--     ↳ fadeLayers - for controlling fade on layers
--       ↳ fadeLayersIn - fade in for layer open
--       ↳ fadeLayersOut - fade out for layer close
--     ↳ fadePopups - for controlling fade on wayland popups
--       ↳ fadePopupsIn - fade in for wayland popup open
--       ↳ fadePopupsOut - fade out for wayland popup close
--     ↳ fadeDpms - for controlling fade when dpms is toggled
--   ↳ border - for animating the border's color switch speed
--   ↳ borderangle - for animating the border's gradient angle - styles: once (default), loop
--   ↳ shadowangle - for animating the shadow's gradient angle - styles: once (default), loop
--   ↳ glowangle - for animating the glow's gradient angle - styles: once (default), loop
--   ↳ workspaces - styles: slide, slidevert, fade, slidefade, slidefadevert
--     ↳ workspacesIn - styles: same as workspaces
--     ↳ workspacesOut - styles: same as workspaces
--     ↳ specialWorkspace - styles: same as workspaces
--       ↳ specialWorkspaceIn - styles: same as workspaces
--       ↳ specialWorkspaceOut - styles: same as workspaces
--   ↳ zoomFactor - animates the screen zoom
--   ↳ monitorAdded - monitor added zoom animation