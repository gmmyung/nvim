return {
  'Exafunction/codeium.vim',
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<C-CR>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-9>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<C-0>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<F5>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
  end
}
