hl.config({
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 3,
        col = {
            active_border   = { colors = {"rgba(FF73D0ee)", "rgba(90DDE9ee)"}, angle = 90},
            inactive_border = "rgba(FFFFFFaa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding         = 5,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee,
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        disable_hyprland_guiutils_check = true,
    },
})
