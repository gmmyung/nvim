return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "folke/neodev.nvim",
    'mfussenegger/nvim-dap'
  },
  config = function()
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
    require("dapui").setup()
  end,
  keys = {
    { '<M-d>', '<cmd>lua require("dapui").toggle()<cr>',          mode = 'n', desc = 'Toggle DAP UI' },
    { '<M-b>', '<cmd>lua require("dap").toggle_breakpoint()<cr>', mode = 'n', desc = 'Toggle DAP breakpoints' },
  },
}
