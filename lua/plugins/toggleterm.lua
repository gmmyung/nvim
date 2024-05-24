return {
  'gmmyung/toggleterm.nvim',
  branch = 'shade_ratio',
  version = "*",
  config = {
    shading_factor = -30,
    shading_ratio = 0.1,
  },
  keys = {
    { '<Leader>t', '<cmd>ToggleTerm direction=vertical size=60<cr>', desc = 'ToggleTerm' },
  },
}
