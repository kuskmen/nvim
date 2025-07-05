local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })


map('n', '<C-h>', function()
  if vim.bo.buftype == 'terminal' then
    return 'i<C-h>'
  end
  return '<C-w>h'
end, { expr = true, silent = true, noremap = true })

map('n', '<C-l>', function()
  if vim.bo.buftype == 'terminal' then
    return 'i<C-l>'
  end
  return '<C-w>l'
end, { expr = true, silent = true, noremap = true })

map("n", "<S-j>", ":m .+1<CR>==", { noremap=true, silent=true })
map("n", "<S-k>", ":m .-2<CR>==", { noremap=true, silent=true })
map("x", "<S-j>", ":m '>+1<CR>gv=gv", { noremap=true, silent=true })
map("x", "<S-k>", ":m '<-2<CR>gv=gv", { noremap=true, silent=true })

map("t", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("t", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "switch window up"})
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "switch window left" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabs
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab"})

-- tabufline
map("n", "<C-n>", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "buffer close"})

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<C-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle"})
map("n", "<C-h>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window"})

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions"})

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
-- use your existing `map = vim.keymap.set` alias
map("n", "<C-t>", function()
  -- look for any live terminal buffer
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      -- focus the first one we find
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  -- if none found, open a new horizontal terminal
  vim.cmd("split")
  vim.cmd("terminal")
end, { desc = "Toggle/focus horizontal terminal" })

map("t", "<C-t>", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new horizontal"})

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
