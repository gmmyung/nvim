return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = true,
  keys = {
    {
      '<M-d>',
      function()
        require('dapui').toggle()
      end,
      mode = 'n',
      desc = 'Toggle DAP UI'
    },
    {
      '<M-b>',
      function()
        require("dap").toggle_breakpoint()
      end,
      mode = 'n',
      desc = 'Toggle DAP breakpoints'
    },
  },
}
