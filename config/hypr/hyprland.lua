-- Main Hyprland configuration file translated from hyprland.conf
-- See https://wiki.hypr.land/Configuring/Start/

------------------
---- IMPORTS ----
------------------

require("keybinds")
require("envVariables")
require("IOconfig")
require("windowRules")
require("workspaceRules")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in     = 2,
        gaps_out    = 4,
        border_size = 1,

        col = {
            active_border   = "rgb(a7c080)",
            inactive_border = "rgb(859289)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },

    decoration = {
        rounding           = 2,
        active_opacity     = 0.9,
        inactive_opacity   = 0.85,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled    = true,
            popups     = true,
            size       = 6,
            passes     = 1,
            noise      = 0.02,
            brightness = 0.8,
            vibrancy   = 0.2,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        middle_click_paste      = false,
        font_family             = "Roboto",
    },
})

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 4, bezier = "myBezier" })
hl.animation({ leaf = "border",      enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 2, bezier = "default" })
