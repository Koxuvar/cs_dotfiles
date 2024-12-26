local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = "window",
  corner_radius = 15,
  position = "left",
  height = 90,
  color = colors.bar.bg,
  padding_right = 3,
  padding_left = 3,
})
