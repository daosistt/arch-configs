return function()
    -- Window tags
    hl.window_rule({
        name = "tag-multimedia-video",
        match = { class = "^([Mm]pv|vlc)$" },
        tag = "+multimedia_video",
    })

    hl.window_rule({
        name = "tag-settings-tools-1",
        match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller)$" },
        tag = "+settings",
    })

    hl.window_rule({
        name = "tag-settings-tools-2",
        match = { class = "^(org.gnome.DiskUtility|wihotspot(-gui)?)$" },
        tag = "+settings",
    })

    hl.window_rule({
        name = "tag-viewer-system-monitor",
        match = { class = "^(org.gnome.SystemMonitor)$" },
        tag = "+viewer",
    })

    hl.window_rule({
        name = "tag-viewer-document",
        match = { class = "^(org.gnome.Evince)$" },
        tag = "+viewer",
    })

    hl.window_rule({
        name = "tag-viewer-image",
        match = { class = "^(eog|org.gnome.Loupe)$" },
        tag = "+viewer",
    })

    -- Window rules
    hl.window_rule({ name = "noblur-multimedia-video", match = { tag = "multimedia_video*" }, no_blur = true })
    hl.window_rule({ name = "opaque-multimedia-video", match = { tag = "multimedia_video*" }, opacity = "1.0" })
    hl.window_rule({ name = "opacity-settings", match = { tag = "settings*" }, opacity = "0.8" })
    hl.window_rule({ name = "opacity-nautilus", match = { class = "^(org.gnome.Nautilus)$" }, opacity = "0.8" })
    hl.window_rule({ name = "opacity-text-editors", match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" }, opacity = "0.9" })
    hl.window_rule({ name = "opacity-pavucontrol", match = { class = "^(org.pulseaudio.pavucontrol)$" }, opacity = "0.9" })
    hl.window_rule({ name = "opacity-kitty", match = { class = "^(kitty)$" }, opacity = "0.9" })
    hl.window_rule({
        name = "opacity-messengers",
        match = { class = "^(discord|vesktop|org.telegram.desktop)$" },
        opacity = "0.85 override 0.7 override 1 override",
    })
    hl.window_rule({
        name = "opacity-spotify",
        match = { class = "^(Spotify)$" },
        opacity = "0.8 override 0.6 override 1 override",
    })

    hl.window_rule({ name = "float-settings", match = { tag = "settings*" }, float = true })
    hl.window_rule({ name = "float-viewer", match = { tag = "viewer*" }, float = true })
    hl.window_rule({ name = "float-multimedia-video", match = { tag = "multimedia_video*" }, float = true })
    hl.window_rule({ name = "size-multimedia-video", match = { tag = "multimedia_video*" }, size = "900 506" })
    hl.window_rule({ name = "float-pavucontrol", match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
    hl.window_rule({ name = "size-pavucontrol", match = { class = "^(org.pulseaudio.pavucontrol)$" }, size = "50% 60%" })
    hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })
    hl.window_rule({
        name = "fix-xwayland-drags",
        match = {
            class = "^$",
            title = "^$",
            xwayland = true,
            float = true,
            fullscreen = false,
            pin = false,
        },
        no_focus = true,
    })
    hl.window_rule({ name = "float-save-dialogs", match = { title = "^(Save As|Save a File|Pick Files)$" }, float = true })
    hl.window_rule({ name = "size-save-dialogs", match = { title = "^(Save As|Save a File|Pick Files)$" }, size = "50% 60%" })
    hl.window_rule({ name = "center-save-dialogs", match = { title = "^(Save As|Save a File|Pick Files)$" }, center = true })
    hl.window_rule({ name = "float-open-files", match = { initial_title = "(Open Files)" }, float = true })
    hl.window_rule({ name = "size-open-files", match = { initial_title = "(Open Files)" }, size = "70% 60%" })

    -- Layer rules
    hl.layer_rule({ name = "blur-waybar", match = { namespace = "waybar" }, blur = true })
    hl.layer_rule({ name = "ignore-alpha-notifications", match = { namespace = "notif*" }, ignore_alpha = 0.5 })
    hl.layer_rule({ name = "blur-logout-dialog", match = { namespace = "logout_dialog" }, blur = true })
    hl.layer_rule({ name = "blur-swaync-control-center", match = { namespace = "swaync-control-center" }, blur = true })
    hl.layer_rule({ name = "blur-swaync-notification-window", match = { namespace = "swaync-notification-window" }, blur = true })
    hl.layer_rule({ name = "ignore-alpha-swaync-control-center", match = { namespace = "swaync-control-center" }, ignore_alpha = 0.5 })
    hl.layer_rule({ name = "ignore-alpha-swaync-notification-window", match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.5 })
    hl.layer_rule({ name = "xray-swaync-control-center", match = { namespace = "swaync-control-center" }, xray = false })
end
