-- remap buffer manager to <leader>b
vim.keymap.set("n", "<leader>b", require("buffer_manager.ui").toggle_quick_menu)
