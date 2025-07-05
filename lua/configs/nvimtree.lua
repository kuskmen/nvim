local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local map = vim.keymap.set

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  map('n', 'l', api.node.open.edit,              opts('Open node'))
  map('n', 'h', api.node.navigate.parent_close,  opts('Close folder'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
