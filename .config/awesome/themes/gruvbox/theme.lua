--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox"
theme.font                                      = "Iosevka Nerd Font 9"
theme.taglist_font                              = "Iosevka Nerd Font 13"
theme.fg_normal                                 = "#1d2021"
theme.fg_focus                                  = "#7b88d3"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = "#1d2021"
theme.bg_focus                                  = "#1d2021"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#fe8019"
theme.taglist_fg_occupied                       = "#ebdbb2"
theme.tasklist_bg_focus                         = "#1d2021"
theme.tasklist_fg_focus                         = "#8ec07c"
theme.border_width                              = 2
theme.border_normal                             = "#1d2021"
theme.border_focus                              = "#689d6a"
theme.border_marked                             = "#CC9393"
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.tasklist_align                            = center
theme.useless_gap                               = 1

local markup = lain.util.markup
local separators = lain.util.separators


-- Textclock
local clock = awful.widget.watch(
    "date +'%I:%M %p'", 60,
    function(widget, stdout)
        widget:set_markup("  " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Iosevka Nerd Font 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MEM
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, "  " .. mem_now.used .. " MB "))
    end
})

-- Battery
local bat = lain.widget.bat({
        settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) < 10 then
                widget:set_markup(markup.font(theme.font, "  " .. bat_now.perc .. "% "))
            elseif not bat_now.perc and tonumber(bat_now.perc) < 20 then
                widget:set_markup(markup.font(theme.font, "  " .. bat_now.perc .. "% "))
            else
                widget:set_markup(markup.font(theme.font, "  " .. bat_now.perc .. "% "))
            end
        else
            widget:set_markup(markup.font(theme.font, "  "))
        end
    end
})

-- Pulseaudio volume
theme.volume = lain.widget.pulse({
        settings = function()
        if volume_now.muted == "yes" then
            widget:set_markup(markup.font(theme.font, "婢  Muted "))
        elseif tonumber(volume_now.left) <= 35 then
            widget:set_markup(markup.font(theme.font, " " .. volume_now.left .. "% "))
        elseif tonumber(volume_now.left) <= 65 then
            widget:set_markup(markup.font(theme.font, "  " .. volume_now.left .. "% "))
        elseif tonumber(volume_now.left) <= 100 then
            widget:set_markup(markup.font(theme.font, "  " .. volume_now.left .. "% "))
        end

    end
})

-- Net
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#1d2021", "   " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})

local separator = wibox.widget {
   widget = wibox.widget.separator,
   orientation = "vertical",
   forced_width = 10,
   color = "#1d2021",
   visible = true
}

function theme.at_screen_connect(s)

    -- All tags open with layout 1
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.noempty, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 22, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.container.background(wibox.container.margin(wibox.widget { mem.widget, layout = wibox.layout.align.horizontal }, 2, 3), "#d3869b"),
            separator,
            wibox.container.background(wibox.container.margin(wibox.widget { theme.volume.widget, layout = wibox.layout.align.horizontal }, 2, 3), "#d79921"),
            separator,
            wibox.container.background(wibox.container.margin(wibox.widget { bat.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#689d6a"),
            separator,
            wibox.container.background(wibox.container.margin(wibox.widget { net.widget, layout = wibox.layout.align.horizontal }, 3, 3), "#83a598"),
            separator,
            wibox.container.background(wibox.container.margin(clock, 4, 8), "#b8bb26"),
            separator,
            --]]
            s.mylayoutbox,
            wibox.widget.systray(),
        },
    }
end

return theme
