local function set_telescope_keymaps()
  vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", {
    desc = 'Find filed', noremap = true, silent = true
  })
  vim.api.nvim_set_keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", {
    desc = 'Find in files', noremap = true, silent = true
  })
  vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", {
    desc = 'Find buffers', noremap = true, silent = true
  })
  vim.api.nvim_set_keymap("n", "<leader>fp", "<Cmd>lua require('telescope').extensions.ghq.list()<CR>", {
    desc = 'Project explorer', noremap = true, silent = true
  })

  vim.keymap.set({ "n", "x" }, "<leader>fr",
    function() require('telescope').extensions.refactoring.refactors() end, {
      desc = "Refactoring"
    })
end

local function set_nvim_tree_keymap()
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>",
    { desc = 'Toggle Nvim tree', noremap = true, silent = true })
end

local function set_spectre_keymap()
  vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
  })
  vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
  })
  vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
  })
  vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
  })
end

local function set_keymaps()
  vim.g.mapleader = ","

  set_telescope_keymaps()
  set_nvim_tree_keymap()
  set_spectre_keymap()
end
return {
  set_keymaps()
}
