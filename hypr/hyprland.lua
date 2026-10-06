--------------------------------------------------------------------------------
-- MONITORS
--------------------------------------------------------------------------------

-- See https://wiki.hyprland.org/Configuring/Monitors/

-- "eDP-1, 1920x1200@60, 0x0, 1.25" was the old config line
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = "0x0",
    scale    = "1.25",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24") 
hl.env("GDK_BACKEND","wayland,x11")

--------------------------------------------------------------------------------
-- MY PROGRAMS
--------------------------------------------------------------------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun -config ~/.config/rofi/config.rasi"

--------------------------------------------------------------------------------
-- AUTOSTART
--------------------------------------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("env GTK_ICON_THEME=Papirus-Dark nm-applet --indicator")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-gammarelay")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'FiraCode Mono 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'")
    -- hl.exec_cmd("kitty --class cmatrix-lock -o window_padding_width=0 --override background=black cmatrix")
end)

--------------------------------------------------------------------------------
-- LOOK AND FEEL
--------------------------------------------------------------------------------

require("mainConfig/lookAndFeel")
require("mainConfig/animations2")

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})

--------------------------------------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------------------------------------

require("/mainConfig/keybinds")

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })

--------------------------------------------------------------------------------
-- WINDOWS AND WORKSPACES
--------------------------------------------------------------------------------

hl.window_rule({ match = { class = "Spotify" }, workspace = "special:spotify" })
hl.window_rule({ match = { class = "de.shorsh.discord.screenaudio" }, workspace = "special:discord" })
hl.window_rule({ match = { class = "org.wireshark.Wireshark" }, workspace = "special:wireshark" })
hl.window_rule({ match = { class = "Arduino IDE" }, workspace = "special:arduino" })
hl.window_rule({ match = { class = "gns3" }, workspace = "special:gns3" })
hl.window_rule({ match = { class = "virt-manager" }, workspace = "special:vm" })
hl.window_rule({ match = { class = "code" }, workspace = "special:code" })
hl.window_rule({ match = { class = "md.obsidian.Obsidian" }, workspace = "special:obsidian" })
hl.window_rule({ match = { class = "rustdesk" }, workspace = "special:rustdesk" })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })

hl.layer_rule({ match = { class = "hyprpicker" }, no_anim = true })
hl.layer_rule({ match = { class = "selection" }, no_anim = true })
