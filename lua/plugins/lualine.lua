return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = {
    options = {
      theme = 'gruvbox',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
  },
}
