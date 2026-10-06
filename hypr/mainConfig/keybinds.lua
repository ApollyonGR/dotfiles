local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun -config ~/.config/rofi/config.rasi"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
--hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
--hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("rfkill unblock wifi"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Controls wl-gammarelay for redlight filter
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move active window to a special workspace with mainMod + SHIFT + [key]
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:spotify"}))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:discord"}))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:wireshark"}))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:arduino"}))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "special:gns3"}))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.move({ workspace = "special:vm"}))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:obsidian"}))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "special:code"}))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.window.move({ workspace = "special:rustdesk"}))

-- Switch through existing workspaces one at a time
hl.bind(mainMod .. " + code:60", hl.dsp.focus({workspace = "+1"})) -- code:60 is a period
hl.bind(mainMod .. " + code:59", hl.dsp.focus({workspace = "-1"}))-- code:59 is a comma
hl.bind(mainMod .. " + SHIFT + code:60", hl.dsp.window.move({workspace ="+1"})) 
hl.bind(mainMod .. " + SHIFT + code:59", hl.dsp.window.move({workspace ="-1"})) 

-- Shift active window across the screen
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({direction = "down"}))

-- Special workspaces for Spotify, Discord, etc.
hl.bind("ALT + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind("ALT + D", hl.dsp.workspace.toggle_special("discord"))
hl.bind("ALT + W", hl.dsp.workspace.toggle_special("wireshark"))
hl.bind("ALT + A", hl.dsp.workspace.toggle_special("arduino"))
hl.bind("ALT + G", hl.dsp.workspace.toggle_special("gns3"))
hl.bind("ALT + V", hl.dsp.workspace.toggle_special("vm"))
hl.bind("ALT + O", hl.dsp.workspace.toggle_special("obsidian"))
hl.bind("ALT + C", hl.dsp.workspace.toggle_special("code"))
hl.bind("ALT + R", hl.dsp.workspace.toggle_special("rustdesk"))

-- Laptop multimedia keys for volume, LCD brightness, and redshift filter.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("hyprctl hyprsunset temperature -200"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl hyprsunset temperature +200"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
