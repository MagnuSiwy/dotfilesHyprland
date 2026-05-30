hl.env("XCURSOR_SIZE", "20")
hl.monitor({
    output       = "",
    mode         = "preferred",
    position     = "auto",
    scale        = 1,
})

hl.config({
    misc = {
        disable_hyprland_logo = true
    },

    animations = {
        enabled = false
    }
})

hl.on("hyprland.start", function ()
    hl.exec_cmd("nwg-hello; hyprctl dispatch exit")
end)
