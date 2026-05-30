------------------------------------------------------------------
-- This section is almost completely system specific.            --
-- You might have a different monitor layout, devices and so on. --
-- You might want to change all of it                            --
------------------------------------------------------------------

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hl.exec_cmd("uwsm app -- ~/.config/hypr/scripts/monitors.sh")
hl.monitor({
    output       = "",
    mode         = "preferred",
    position     = "auto",
    scale        = 1,
})


----------------------
---- INPUT DEVICES ---
----------------------

hl.config({
    input = {
        kb_layout               = "pl",
        numlock_by_default      = true,
        follow_mouse            = 1,
        mouse_refocus           = false,
        sensitivity             = 0.2,
        emulate_discrete_scroll = 1,

        touchpad = {
            natural_scroll       = false,
            disable_while_typing = true,
        },
    },
})

hl.config({
    gestures = {
        -- workspace_swipe              = true,
        workspace_swipe_touch          = true,
        workspace_swipe_invert         = false,
        workspace_swipe_cancel_ratio   = 0.1,
        workspace_swipe_create_new     = true,
        workspace_swipe_direction_lock = false,
    },
})


----------------------
---- PER-DEVICE  ----
----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
    name          = "logitech-mx-master-3-1",
    sensitivity   = -1.0,
    accel_profile = "custom 1.0 0.0 1.0",
    scroll_points = "1.0 0.0 1.0",
})

hl.device({
    name          = "logitech-mx-master-3s",
    sensitivity   = -1.0,
    accel_profile = "custom 1.0 0.0 1.0",
    scroll_points = "1.0 0.0 1.0",
})

hl.device({
    name          = "logitech-wireless-mouse-mx-master-3-1",
    sensitivity   = -1.0,
    accel_profile = "custom 1.0 0.0 1.0",
    scroll_points = "1.0 0.0 1.0",
})

hl.device({
    name        = "etps/2-elantech-trackpoint",
    sensitivity = -0.3,
})

hl.device({
    name        = "thomas-haukland-cheapino2-mouse",
    sensitivity = -0.7,
})

hl.device({
    name        = "bt4.0-mouse",
    sensitivity = -0.7,
})
