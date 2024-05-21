return {
  'gmmyung/toggleterm.nvim',
  branch = 'shade_ratio',
  version = "*",
  config = {
    shading_factor = -30,
    shading_ratio = 0.1,
  },
  keys = {
    { '<M-t>', '<cmd>ToggleTerm direction=vertical size=40<cr>', desc = 'ToggleTerm' },
  },
}
