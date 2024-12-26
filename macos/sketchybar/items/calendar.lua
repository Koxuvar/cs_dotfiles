local settings = require("settings")
local colors = require("colors")

local time = sbar.add("item", {
    label = {
        color = colors.white,
        padding_right = 16,
        width = 85,
        align = "right",
        ont = { family = settings.font.numbers },
    },
    position = "right",
    update_freq = 30,
    padding_left = 1,
    padding_right = 1,
    background = {
        color = colors.bg2,
        border_color = colors.black,
        border_width = 3
    },
})

local cal = sbar.add("item", {
    icon = {
        color = colors.white,
        padding_left = 12,
        font = {
            style = settings.font.style_map["Bold"],
            size = 14.0,
        },
    },
    position = "right",
    update_freq = 30,
    padding_left = 1,
    padding_right = 6,
    background = {
        color = colors.bg2,
        border_color = colors.black,
        border_width = 3,
    },
})


cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
    cal:set({ icon = os.date("%b %d") })
end)


time:subscribe({ "forced", "routine", "system_woke" }, function(env)
    time:set({ label = os.date("%I:%M %p") })
end)
