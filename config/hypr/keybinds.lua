---------------------
---- KEYBINDINGS ----
---------------------

------------------------------
---- DEFAULT VARIABLES ----
------------------------------

local mainMod     = "SUPER"
local terminal    = "kitty"
local browser     = "firefox"
local fileManager = "nautilus"
local menu        = 'rofi -show drun -theme ~/.config/rofi/config.rasi -run-command "uwsm app -- {cmd}"'
local uwsm_run    = "uwsm app -- "


-------------------
---- BASIC APPS ---
-------------------

hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exec_cmd(uwsm_run .. "wlogout"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(uwsm_run .. terminal))
hl.bind(mainMod .. " + F",      hl.dsp.exec_cmd(uwsm_run .. browser, { workspace = "2" }))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(uwsm_run .. fileManager))
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd(uwsm_run .. menu))


-----------------------
---- SCREEN CAPTURE ---
-----------------------

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(uwsm_run .. "$(slurp | grim -g -)"))
hl.bind("PRINT",               hl.dsp.exec_cmd(uwsm_run .. "$(slurp | grim -g - - | wl-copy)"))


--------------------
---- DISCORD     ---
--------------------

hl.bind("ALT_L + Q", hl.dsp.pass({ window = "class:^discord$" }))


-----------------------
---- WINDOW CONTROLS --
-----------------------

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pin())


------------------------------
---- AUDIO AND MEDIA KEYS ----
------------------------------

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(uwsm_run .. "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(uwsm_run .. "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(uwsm_run .. "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd(uwsm_run .. "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd(uwsm_run .. "playerctl previous"), { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd(uwsm_run .. "playerctl next"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd(uwsm_run .. "playerctl play-pause"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(uwsm_run .. "brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(uwsm_run .. "brightnessctl set 5%-"), { locked = true, repeating = true })


--------------------------
---- MOVE WINDOW FOCUS ---
--------------------------

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))


--------------------------
---- SWAP WINDOWS    ----
--------------------------

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))


--------------------------
---- RESIZE WINDOWS   ----
--------------------------

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 20,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 20, relative = true }), { repeating = true })


-------------------------
---- WORKSPACES      ----
-------------------------

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end


------------------------
---- SWITCH BINDS   ----
------------------------

hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("kanshictl switch desk"),      { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("kanshictl switch dual_desk"), { locked = true })


----------------------
---- MOUSE BINDS  ----
----------------------

-- Scroll through existing workspaces
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
