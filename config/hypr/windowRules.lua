----------------------
---- WINDOW RULES ----
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Telegram: float and size
hl.window_rule({
    name  = "telegram-float",
    match = { class = "org.telegram.desktop" },
    float = true,
    size  = "370 500",
})

-- Discord: float and size
hl.window_rule({
    name  = "discord-float",
    match = { class = "discord" },
    float = true,
    size  = "1150 650",
})

-- Lutris: float, sized, send to workspace 1 silently
hl.window_rule({
    name      = "lutris-setup",
    match     = { class = "net.lutris.Lutris" },
    float     = true,
    size      = "1000 900",
    workspace = "1 silent",
})

-- Steam: float, workspace 1 silent
hl.window_rule({
    name      = "steam-setup",
    match     = { class = "steam" },
    float     = true,
    workspace = "1 silent",
})

-- Firefox Google Sign-In: float
hl.window_rule({
    name  = "firefox-google-signin-float",
    match = { class = "firefox", title = "(.*Sign In - Google Accounts.*)" },
    float = true,
})

-- Firefox Bitwarden: float
hl.window_rule({
    name  = "firefox-bitwarden-float",
    match = { class = "firefox", title = "(.*Bitwarden.*)" },
    float = true,
})

-- Picture-in-Picture: float
hl.window_rule({
    name  = "pip-float",
    match = { title = "^Picture-in-Picture$" },
    float = true,
})

-- Spotify: workspace 3 silent
hl.window_rule({
    name      = "spotify-workspace",
    match     = { class = "^Spotify$" },
    workspace = "3 silent",
})

-- Tidal-hifi: workspace 3 silent
hl.window_rule({
    name      = "tidal-workspace",
    match     = { class = "^tidal-hifi$" },
    workspace = "3 silent",
})

-- Firefox basic rules
hl.window_rule({
    name    = "firefox-basic-rules",
    match   = { class = "firefox" },
    opacity = "0.8 override 0.75 override 1.0 override",
--    workspace = "2"
})

-- Streaming sites: full opacity
local streamingTitles = {
    ["youtube"]      = "(.*YouTube.*)",
    ["max"]          = "(.*Max.*)",
    ["prime-video"]  = "(.*Prime Video.*)",
    ["netflix"]      = "(.*Netflix.*)",
    ["disney"]       = "(.*Disney.*)",
    ["twitch"]       = "(.*Twitch.*)",
    ["kick"]         = "(.*Kick.*)",
}

for name, title in pairs(streamingTitles) do
    hl.window_rule({
        name    = "opacity-" .. name,
        match   = { title = title },
        opacity = "1.0 override",
    })
end

-- Firefox Picture-in-Picture: sized + full opacity
hl.window_rule({
    name    = "firefox-pip",
    match   = { class = "firefox", title = "Picture-in-Picture" },
    opacity = "1.0 override",
    size    = "750 422",
})

-- Pinned windows: full opacity
hl.window_rule({
    name    = "pinned-opacity",
    match   = { pin = true },
    opacity = "1.0 override",
})

-- Idle inhibit fullscreen for all classes
hl.window_rule({
    name           = "idle-inhibit-fullscreen",
    match          = { class = ".*" },
    idle_inhibit   = "fullscreen",
})

-- Suppress maximize events for all classes
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- xwaylandvideobridge: hide it
hl.window_rule({
    name    = "xwvb-opacity",
    match   = { class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override",
})

hl.window_rule({
    name    = "xwvb-no-anim",
    match   = { class = "^(xwaylandvideobridge)$" },
    no_anim = true,
})

hl.window_rule({
    name             = "xwvb-no-initial-focus",
    match            = { class = "^(xwaylandvideobridge)$" },
    no_initial_focus = true,
})

hl.window_rule({
    name     = "xwvb-max-size",
    match    = { class = "^(xwaylandvideobridge)$" },
    max_size = "1 1",
})

hl.window_rule({
    name    = "xwvb-no-blur",
    match   = { class = "^(xwaylandvideobridge)$" },
    no_blur = true,
})
