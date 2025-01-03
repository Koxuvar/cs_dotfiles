return {
  paddings = 3,
  group_paddings = 5,

  icons = "NerdFont", -- alternatively available: NerdFont

  -- This is a font configuration for SF Pro and SF Mono (installed manually)
  -- font = require("helpers.default_font"),

  -- Alternatively, this is a font config for JetbrainsMono Nerd Font
  font = {
    text = "JetbrainsMono Nerd Font", -- Used for text
    numbers = "JetbrainsMono Nerd Font", -- Used for numbers
    style_map = {
      ["Regular"] = "Regular",
      ["Semibold"] = "Medium",
      ["Bold"] = "SemiBold",
      ["Heavy"] = "Bold",
      ["Black"] = "ExtraBold",
    },
  },
}
