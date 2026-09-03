return function(opts)
    local mainMod = opts.mainMod
    local terminal = opts.terminal
    local fileManager = opts.fileManager
    local menu = opts.menu

    -- Main commands
    hl.bind(mainMod .. "+Q", hl.dsp.window.close())
    hl.bind("CTRL+ALT+Delete", hl.dsp.exit())
    hl.bind(mainMod .. "+SHIFT+L", hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprlock.sh"))

    -- Main apps
    hl.bind(mainMod .. "+T", hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. "+SHIFT+RETURN", hl.dsp.exec_cmd("[float; size 800 550] " .. terminal))
    hl.bind(mainMod .. "+F", hl.dsp.exec_cmd('xdg-open "https://"'))
    hl.bind(mainMod .. "+A", hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. "+E", hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. "+Y", hl.dsp.exec_cmd("kitty -e ranger"))
    hl.bind(mainMod .. "+SHIFT+C", hl.dsp.exec_cmd("code"))
    hl.bind(mainMod .. "+SHIFT+E", hl.dsp.exec_cmd("kitty yazi"))

    -- Scripts
    hl.bind(mainMod .. "+W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wppicker.sh"))
    hl.bind(mainMod .. "+SHIFT+S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
    hl.bind(mainMod .. "+R", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))
    hl.bind(mainMod .. "+CTRL+B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarStyles.sh"))
    hl.bind(mainMod .. "+ALT+B", hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarLayout.sh"))
    hl.bind(mainMod .. "+SHIFT+Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/KillActiveProcess.sh"))
    hl.bind(mainMod .. "+C", hl.dsp.exec_cmd("hyprpicker -a"))
    hl.bind(mainMod .. "+H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

    -- Window state
    hl.bind(mainMod .. "+Space", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. "+P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. "+SHIFT+F", hl.dsp.window.fullscreen({ action = "toggle" }))
    hl.bind(mainMod .. "+J", hl.dsp.window.swap({ next = true }))

    -- Focus
    hl.bind(mainMod .. "+left", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. "+right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. "+up", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. "+down", hl.dsp.focus({ direction = "down" }))

    -- Move windows
    hl.bind(mainMod .. "+CTRL+left", hl.dsp.window.move({ direction = "left" }))
    hl.bind(mainMod .. "+CTRL+right", hl.dsp.window.move({ direction = "right" }))
    hl.bind(mainMod .. "+CTRL+up", hl.dsp.window.move({ direction = "up" }))
    hl.bind(mainMod .. "+CTRL+down", hl.dsp.window.move({ direction = "down" }))

    -- Resize windows
    hl.bind(mainMod .. "+SHIFT+left", hl.dsp.window.resize({ x = -50, y = 0 }), { repeating = true })
    hl.bind(mainMod .. "+SHIFT+right", hl.dsp.window.resize({ x = 50, y = 0 }), { repeating = true })
    hl.bind(mainMod .. "+SHIFT+up", hl.dsp.window.resize({ x = 0, y = -50 }), { repeating = true })
    hl.bind(mainMod .. "+SHIFT+down", hl.dsp.window.resize({ x = 0, y = 50 }), { repeating = true })

    -- Workspaces
    for i = 1, 10 do
        local key = i % 10
        hl.bind(mainMod .. "+" .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. "+SHIFT+" .. key, hl.dsp.window.move({ workspace = i }))
    end

    hl.bind(mainMod .. "+SHIFT+i", hl.dsp.window.move({ workspace = 11 }))
    hl.bind(mainMod .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. "+mouse_up", hl.dsp.focus({ workspace = "e-1" }))

    -- Mouse
    hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Media keys
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"), { locked = true, repeating = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle"), { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
end
