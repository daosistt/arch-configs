local colors = {
    background = "rgba(1a1110ff)",
    error = "rgba(ffb4abff)",
    error_container = "rgba(93000aff)",
    inverse_on_surface = "rgba(392e2dff)",
    inverse_primary = "rgba(904a43ff)",
    inverse_surface = "rgba(f1dedcff)",
    on_background = "rgba(f1dedcff)",
    on_error = "rgba(690005ff)",
    on_error_container = "rgba(ffdad6ff)",
    on_primary = "rgba(561e19ff)",
    on_primary_container = "rgba(ffdad5ff)",
    on_primary_fixed = "rgba(3b0907ff)",
    on_primary_fixed_variant = "rgba(73342dff)",
    on_secondary = "rgba(442926ff)",
    on_secondary_container = "rgba(ffdad5ff)",
    on_secondary_fixed = "rgba(2c1512ff)",
    on_secondary_fixed_variant = "rgba(5d3f3cff)",
    on_surface = "rgba(f1dedcff)",
    on_surface_variant = "rgba(d8c2bfff)",
    on_tertiary = "rgba(3f2e04ff)",
    on_tertiary_container = "rgba(fddfa6ff)",
    on_tertiary_fixed = "rgba(261a00ff)",
    on_tertiary_fixed_variant = "rgba(574419ff)",
    outline = "rgba(a08c8aff)",
    outline_variant = "rgba(534341ff)",
    primary = "rgba(ffb4abff)",
    primary_container = "rgba(73342dff)",
    primary_fixed = "rgba(ffdad5ff)",
    primary_fixed_dim = "rgba(ffb4abff)",
    scrim = "rgba(000000ff)",
    secondary = "rgba(e7bdb7ff)",
    secondary_container = "rgba(5d3f3cff)",
    secondary_fixed = "rgba(ffdad5ff)",
    secondary_fixed_dim = "rgba(e7bdb7ff)",
    shadow = "rgba(000000ff)",
    source_color = "rgba(921a17ff)",
    surface = "rgba(1a1110ff)",
    surface_bright = "rgba(423735ff)",
    surface_container = "rgba(271d1cff)",
    surface_container_high = "rgba(322826ff)",
    surface_container_highest = "rgba(3d3231ff)",
    surface_container_low = "rgba(231918ff)",
    surface_container_lowest = "rgba(140c0bff)",
    surface_dim = "rgba(1a1110ff)",
    surface_tint = "rgba(ffb4abff)",
    surface_variant = "rgba(534341ff)",
    tertiary = "rgba(e0c38cff)",
    tertiary_container = "rgba(574419ff)",
    tertiary_fixed = "rgba(fddfa6ff)",
    tertiary_fixed_dim = "rgba(e0c38cff)",
}

local image = "/home/user/Pictures/wallpapers/wall-05.png"
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local mainMod = "SUPER"

------------------
---- MONITORS ----
------------------

-- Equivalent to no active monitor line in the old config: let Hyprland choose.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("sleep 1 && awww img ~/.config/hypr/current_wallpaper")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = colors.outline,
            inactive_border = colors.outline_variant,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            special = false,
            popups = true,
            xray = true,
            vibrancy = 0.1696,
        },
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        screencopy_force_8b = true,
    },
    debug = {
        vfr = true,
    },
    render = {
        new_render_scheduling = true,
    },
})

----------------
---- INPUT ----
----------------

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        force_no_accel = true,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", action = function() hl.exec_cmd(terminal) end })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.exec_cmd("code") end })

hl.device({
    name = "elan2611:00-04f3:31dc-touchpad",
    accel_profile = "flat",
    sensitivity = 1.0,
})

local config_dir = os.getenv("HOME") .. "/.config/hypr"

dofile(config_dir .. "/animations.lua")()
dofile(config_dir .. "/rules.lua")()
dofile(config_dir .. "/binds.lua")({
    mainMod = mainMod,
    terminal = terminal,
    fileManager = fileManager,
    menu = menu,
})
