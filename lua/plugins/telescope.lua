return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          hijack_netrw = true,
          git_status = false,
          no_ignore = true,
        }
      }
    }
    require('telescope').load_extension 'file_browser'
  end,
  keys = {
    { '<Leader>d', '<cmd>Telescope file_browser<cr>', mode = 'n', desc = 'Telescope file browser' },
    { '<Leader>b', '<cmd>Telescope buffers<cr>',      mode = 'n', desc = 'Telescope buffers' },
    { '<Leader>f', '<cmd>Telescope find_files<cr>',   mode = 'n', desc = 'Telescope find files' },
    { '<Leader>g', '<cmd>Telescope git_files<cr>',    mode = 'n', desc = 'Telescope git files' },
    { '<Leader>l', '<cmd>Telescope live_grep<cr>',    mode = 'n', desc = 'Telescope live grep' },
  }
}
