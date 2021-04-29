local filesystem                = require('gears.filesystem')
local beautiful                 = require("beautiful")
local config_dir                = filesystem.get_configuration_dir()
local utils_dir                 = config_dir .. 'utilities/'

default_apps.screeh_shot        = "spectacle"
default_apps.lock_screen        = "$HOME/.local/bin/i3lock-blur"
default_apps.software_updater   = "kitty --title" ..
                                    "'System upgrade' -e sudo powerpill -Syu"
default_apps.bluetooth_manager  = "kitty -e bluetoothctl"
default_apps.network_manager    = "kitty -e nmtui"
default_apps.filemanager        = "nautilus"
default_apps.app_menu           = "rofi -dpi " .. screen.primary.dpi ..
                                    " -show drun -theme " .. config_dir ..
                                    "config/rofi.rasi -icon-theme " ..
                                    beautiful.icon_theme

return default_apps


return {
    -- The default applications that we will use in keybindings and widgets
    default = {
        -- Default terminal emulator
        terminal            = 'kitty',
        -- Default web browser
        web_browser         = 'firefox',
        -- Default text editor
        text_editor         = 'nvim',
        -- Default file manager
        file_manager        = 'dolphin',
        -- Default media player
        multimedia          = 'mpv',
        -- Default graphics editor
        graphics            = 'gimp-2.10',
        -- Default sandbox
        sandbox             = 'virtualbox',
        -- Default IDE
        development         = 'vscodium',
        -- Default network manager
        network_manager     = 'kitty iwctl',
        -- Default bluetooth manager
        bluetooth_manager   = 'blueman-manager',
        -- Default power manager
        power_manager       = 'xfce4-power-manager',
        -- Default GUI package manager
        package_manager     = 'pamac-manager',
        -- Default locker
        lock                = 'awesome-client "awesome.emit_signal('..
                               '\'module::lockscreen_show\')"',
        -- Default quake terminal
        quake               = 'kitty --name QuakeTerminal',
        -- Default rofi global menu
        rofi_global         = 'rofi -dpi ' .. screen.primary.dpi .. 
                               ' -show "Global Search"'  ..
                               ' -modi "Global Search":' .. config_dir .. 
                               'config/rofi/global/rofi-spotlight.sh'  .. 
                               ' -theme '  .. config_dir ..
                               'config/rofi/global/rofi.rasi',
        -- Default app menu
        rofi_appmenu        = 'rofi -dpi ' .. screen.primary.dpi ..
                               ' -show drun -theme ' .. config_dir ..
                               '/config/rofi/appmenu/rofi.rasi'

    },

    -- List of apps to start once on start-up
    run_on_start_up = {
        -- Compositor
        'picom -b --experimental-backends --dbus --config ' ..
        config_dir .. '/configuration/picom.conf',
        -- Blueman applet
        'blueman-applet',
        -- Music server
        'mpd',
        -- Polkit and keyring
        -- '/usr/bin/lxqt-policykit-agent &' ..
        -- ' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
        -- Load Xresources
        'xrdb $HOME/.Xresources',
        -- Audio equalizer
        'pulseeffects --gapplication-service',
        -- Lockscreen timer
        [[
        xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
        "awesome-client 'awesome.emit_signal(\"module::lockscreen_show\")'" ""
        ]]
    },

    -- List of binaries/shell scripts that will execute for a certain task
    utils = {
        -- Fullscreen screenshot
        full_screenshot = utils_dir .. 'snap full',
        -- Area screenshot
        area_screenshot = utils_dir .. 'snap area',
        -- Update profile picture
        update_profile  = utils_dir .. 'profile-image'
    }
}
