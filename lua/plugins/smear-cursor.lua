return {
  "sphamba/smear-cursor.nvim",
  opts = {                                -- Default  Range
    enabled = false,
    stiffness = 0.6,                      -- 0.6      [0, 1]
    trailing_stiffness = 0.5,             -- 0.45     [0, 1]
    stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
    trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    damping = 0.95,                       -- 0.85     [0, 1]
    damping_insert_mode = 0.95,           -- 0.9      [0, 1]
    distance_stop_animating = 0.5,        -- 0.1      > 0
    -- Smear cursor color. Defaults to Cursor GUI color if not set.
    -- Set to "none" to match the text color at the target cursor position.
    -- Can be a hex color code, or a highlight group name.
    cursor_color = "#d3cdc3",
  },
}
