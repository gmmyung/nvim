local builtin = require('telescope.builtin')
require("telescope").setup {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

local file_browser = require("telescope").load_extension("file_browser")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>d', file_browser.file_browser, {})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:

